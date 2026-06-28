import re
import requests
import pandas as pd
from bs4 import BeautifulSoup
from urllib.parse import urljoin
from pathlib import Path

PAGE = "https://bocsar.nsw.gov.au/statistics-dashboards/crime-and-policing/lga-excel-crime-tables.html"
OUT = Path("bocsar_lga_xlsx")
OUT.mkdir(exist_ok=True)

OUTPUT_CSV = "bocsar_lga_summary_offences_long.csv"
OUTPUT_PARQUET = "bocsar_lga_summary_offences_long.parquet"
FAILED_CSV = "bocsar_lga_failed_downloads.csv"

SKIP_LINK_NAMES = {
    "New South Wales",
    "Greater Sydney",
    "Regional New South Wales",
    "Definitions and explanations",
}


def safe_filename(name):
    name = re.sub(r"[^A-Za-z0-9]+", "_", str(name)).strip("_")
    return name or "unknown_lga"


def clean_year(x):
    s = str(x)
    m = re.search(r"(April \d{4}\s*-\s*March \d{4})", s)
    return m.group(1).replace("  ", " ") if m else None


def parse_summary(file_path, lga_name):
    raw = pd.read_excel(
        file_path,
        sheet_name="Summary of offences",
        header=None,
        engine="openpyxl",
    )

    start_matches = raw.index[
        raw.iloc[:, 1].astype(str).str.strip().eq("Offence type")
    ]

    if len(start_matches) == 0:
        raise ValueError("Could not find 'Offence type' row")

    start = start_matches[0] + 1

    incident_cols = list(range(6, 16))   # G:P
    rate_cols = list(range(16, 26))      # Q:Z

    years_inc = [
        clean_year(raw.iloc[start - 2, c]) or clean_year(raw.iloc[start - 1, c])
        for c in incident_cols
    ]

    years_rate = [
        clean_year(raw.iloc[start - 2, c]) or clean_year(raw.iloc[start - 1, c])
        for c in rate_cols
    ]

    if any(y is None for y in years_inc):
        raise ValueError(f"Could not parse incident year headers: {years_inc}")

    if any(y is None for y in years_rate):
        raise ValueError(f"Could not parse rate year headers: {years_rate}")

    df = raw.iloc[start:].copy()

    # Keep rows with offence type only
    df = df[df.iloc[:, 1].notna()].copy()

    # Remove footer / notes if present
    df = df[
        ~df.iloc[:, 1]
        .astype(str)
        .str.contains("For murder|not applicable|Definitions", case=False, na=False)
    ].copy()

    base = df.iloc[:, [0, 1]].copy()
    base.columns = ["offence_group", "offence_type"]
    base["offence_group"] = base["offence_group"].ffill()

    inc = df.iloc[:, incident_cols].copy()
    inc.columns = years_inc

    rate = df.iloc[:, rate_cols].copy()
    rate.columns = years_rate

    inc_long = inc.assign(row_id=base.index).melt(
        id_vars="row_id",
        var_name="year_ending",
        value_name="incidents_recorded",
    )

    rate_long = rate.assign(row_id=base.index).melt(
        id_vars="row_id",
        var_name="year_ending",
        value_name="rate_per_100000",
    )

    out = (
        base.assign(row_id=base.index)
        .merge(inc_long, on="row_id", how="inner")
        .merge(rate_long, on=["row_id", "year_ending"], how="inner")
        .drop(columns="row_id")
    )

    out.insert(0, "lga", lga_name)

    out["incidents_recorded"] = pd.to_numeric(out["incidents_recorded"], errors="coerce")
    out["rate_per_100000"] = pd.to_numeric(out["rate_per_100000"], errors="coerce")

    return out


def get_excel_links():
    html = requests.get(PAGE, timeout=30).text
    soup = BeautifulSoup(html, "html.parser")

    links = []

    for a in soup.select("a[href]"):
        href = a.get("href", "")
        text = a.get_text(strip=True)

        if ".xlsx" not in href.lower():
            continue

        url = urljoin(PAGE, href)

        lga = text
        if not lga:
            lga = Path(url.split("?")[0]).stem

        lga = lga.strip()

        if lga in SKIP_LINK_NAMES:
            continue

        links.append((lga, url))

    # de-duplicate
    seen = set()
    deduped = []
    for lga, url in links:
        key = (lga, url)
        if key not in seen:
            seen.add(key)
            deduped.append((lga, url))

    return deduped


def main():
    links = get_excel_links()

    print(f"Found {len(links)} Excel links")

    all_data = []
    failures = []

    for lga, url in links:
        print(f"Processing: {lga}")

        try:
            file_path = OUT / f"{safe_filename(lga)}.xlsx"

            r = requests.get(url, timeout=60)
            r.raise_for_status()

            if not r.content.startswith(b"PK"):
                raise ValueError(
                    f"Downloaded content is not XLSX. "
                    f"Content-Type={r.headers.get('Content-Type')}"
                )

            file_path.write_bytes(r.content)

            df_lga = parse_summary(file_path, lga)
            all_data.append(df_lga)

        except Exception as e:
            failures.append(
                {
                    "lga": lga,
                    "url": url,
                    "error": repr(e),
                }
            )
            print(f"FAILED: {lga} | {e}")

    if all_data:
        combined = pd.concat(all_data, ignore_index=True)

        combined.to_csv(OUTPUT_CSV, index=False)
        combined.to_parquet(OUTPUT_PARQUET, index=False)

        print()
        print(f"Saved CSV: {OUTPUT_CSV}")
        print(f"Saved Parquet: {OUTPUT_PARQUET}")
        print(f"Rows: {len(combined):,}")
        print(f"Success LGAs: {len(all_data)}")
    else:
        print("No successful LGA files parsed.")

    print(f"Failed LGAs: {len(failures)}")

    if failures:
        pd.DataFrame(failures).to_csv(FAILED_CSV, index=False)
        print(f"Saved failure summary: {FAILED_CSV}")

        print()
        print("Failed list:")
        for f in failures:
            print(f"- {f['lga']}: {f['error']}")


if __name__ == "__main__":
    main()