from pathlib import Path
from typing import Any

import pandas as pd

from src.com.config.settings import (
    DUCKDB_PATH,
    SCHOOL_PROFILE_COMMENTARY_TABLE,
    SCHOOL_PROFILE_OUTPUT_DIR,
    SCHOOL_PROFILE_SITEMAP_OUTPUT_PATH,
    SOURCE_TABLE,
)
from src.com.pipeline.school_search_pipeline import slugify
from src.com.tools.duckdb_client import read_duckdb_query
from src.com.tools.json_writer import write_minified_json


SCHOOL_COLUMNS = [
    "calendar_year",
    "acara_sml_id",
    "school_name",
    "suburb",
    "state",
    "postcode",
    "campus_type",
    "reporting_type",
    "school_sector",
    "fully_selective",
    "school_type",
    "year_range",
    "school_url",
    "commentary",
    "icsea_score",
    "icsea_percentile",
    "sea_bottom_pct",
    "sea_lower_mid_pct",
    "sea_upper_mid_pct",
    "sea_top_pct",
    "total_enrolments",
    "girls_enrolments",
    "boys_enrolments",
    "lbote_yes_pct",
    "latitude",
    "longitude",
    "primary_rating",
    "secondary_rating",
    "primary_rank_au",
    "primary_rank_state",
    "primary_rank_state_sector",
    "primary_pct_au",
    "primary_grade_au",
    "primary_pct_state",
    "primary_pct_state_sector",
    "primary_pct_mainstream_state_sector",
    "secondary_rank_au",
    "secondary_rank_state",
    "secondary_rank_state_sector",
    "secondary_pct_au",
    "secondary_grade_au",
    "secondary_pct_state",
    "secondary_pct_state_sector",
    "secondary_pct_mainstream_state_sector",
    "primary_icsea_peer_count_state_sector",
    "primary_rank_icsea_state_sector",
    "primary_pct_icsea_state_sector",
    "secondary_icsea_peer_count_state_sector",
    "secondary_rank_icsea_state_sector",
    "secondary_pct_icsea_state_sector",
]

HISTORY_COLUMNS = [
    "calendar_year",
    "icsea_score",
    "icsea_percentile",
    "sea_bottom_pct",
    "sea_lower_mid_pct",
    "sea_upper_mid_pct",
    "sea_top_pct",
    "total_enrolments",
    "girls_enrolments",
    "boys_enrolments",
    "lbote_yes_pct",
    "primary_rating",
    "secondary_rating",
    "primary_rank_au",
    "primary_rank_state",
    "primary_rank_state_sector",
    "primary_pct_au",
    "primary_grade_au",
    "primary_pct_state",
    "primary_pct_state_sector",
    "primary_pct_mainstream_state_sector",
    "secondary_rank_au",
    "secondary_rank_state",
    "secondary_rank_state_sector",
    "secondary_pct_au",
    "secondary_grade_au",
    "secondary_pct_state",
    "secondary_pct_state_sector",
    "secondary_pct_mainstream_state_sector",
    "primary_icsea_peer_count_state_sector",
    "primary_rank_icsea_state_sector",
    "primary_pct_icsea_state_sector",
    "secondary_icsea_peer_count_state_sector",
    "secondary_rank_icsea_state_sector",
    "secondary_pct_icsea_state_sector",
]


def build_school_profile_sql() -> str:
    selected_columns = ",\n        ".join(
        f"source_data.{column_name}"
        for column_name in SCHOOL_COLUMNS
        if column_name not in {"school_url", "commentary"}
    )

    return f"""
    WITH max_year_cte AS (
        SELECT MAX(source_data.calendar_year) AS max_calendar_year
        FROM {SOURCE_TABLE} AS source_data
    ),

    active_school_cte AS (
        SELECT DISTINCT source_data.acara_sml_id
        FROM {SOURCE_TABLE} AS source_data
        INNER JOIN max_year_cte AS max_year
            ON source_data.calendar_year = max_year.max_calendar_year
    ),

    url AS (
        SELECT
            school_profile.acara_sml_id,
            school_profile.school_url
        FROM main.school_profile AS school_profile
        WHERE school_profile.calendar_year = (
            SELECT MAX(calendar_year)
            FROM main.school_profile
        )
    ),

    commentary AS (
        SELECT
            school_commentary.acara_sml_id,
            school_commentary.commentary
        FROM {SCHOOL_PROFILE_COMMENTARY_TABLE} AS school_commentary
    )

    SELECT
        {selected_columns},
        url.school_url,
        commentary.commentary
    FROM {SOURCE_TABLE} AS source_data
    INNER JOIN active_school_cte AS active_school
        ON source_data.acara_sml_id = active_school.acara_sml_id
    LEFT JOIN url
        ON url.acara_sml_id = source_data.acara_sml_id
    LEFT JOIN commentary
        ON commentary.acara_sml_id = source_data.acara_sml_id
    ORDER BY source_data.acara_sml_id, source_data.calendar_year
    """


def dataframe_to_records(df: pd.DataFrame) -> list[dict[str, Any]]:
    df = df.copy()
    df = df.astype(object).where(pd.notnull(df), None)
    return df.to_dict(orient="records")


def make_school_slug(school: dict[str, Any]) -> str:
    return "-".join(
        part
        for part in [
            slugify(school.get("school_name")),
            slugify(school.get("state")),
            slugify(school.get("acara_sml_id")),
        ]
        if part
    )


def make_sitemap_entry(school: dict[str, Any], slug: str) -> dict[str, Any]:
    return {
        "url": f"/school-profile/{slug}",
        "slug": slug,
        "acara_sml_id": school.get("acara_sml_id"),
        "school_name": school.get("school_name"),
        "state": school.get("state"),
        "calendar_year": school.get("calendar_year"),
    }


def write_school_profile_files(
    df: pd.DataFrame,
    output_dir: Path,
) -> tuple[int, list[dict[str, Any]]]:
    if df.empty:
        print("No active school profile records found.")
        return 0, []

    latest_year = int(df["calendar_year"].max())
    files_written = 0
    sitemap_entries: list[dict[str, Any]] = []

    for acara_sml_id, school_df in df.groupby("acara_sml_id", dropna=False):
        school_df = school_df.sort_values("calendar_year")
        latest_df = school_df[school_df["calendar_year"] == latest_year]

        if latest_df.empty:
            continue

        school = dataframe_to_records(latest_df[SCHOOL_COLUMNS].head(1))[0]
        history = dataframe_to_records(school_df[HISTORY_COLUMNS])

        slug = make_school_slug(school)

        if not slug:
            raise ValueError(f"Unable to generate slug for school ID: {acara_sml_id}")

        payload = {
            "school": school,
            "history": history,
        }

        write_minified_json(payload, output_dir / f"{slug}.json")
        sitemap_entries.append(make_sitemap_entry(school, slug))

        files_written += 1

    sitemap_entries.sort(
        key=lambda item: (
            str(item.get("state") or ""),
            str(item.get("school_name") or ""),
        )
    )

    return files_written, sitemap_entries


def write_school_profile_sitemap_file(
    sitemap_entries: list[dict[str, Any]],
    output_path: Path,
) -> None:
    write_minified_json(sitemap_entries, output_path)


def run_school_profile_pipeline() -> None:
    sql = build_school_profile_sql()
    df = read_duckdb_query(DUCKDB_PATH, sql)

    files_written, sitemap_entries = write_school_profile_files(
        df,
        SCHOOL_PROFILE_OUTPUT_DIR,
    )

    write_school_profile_sitemap_file(
        sitemap_entries,
        SCHOOL_PROFILE_SITEMAP_OUTPUT_PATH,
    )

    print("School profile JSON generation completed.")
    print(f"Active schools exported: {files_written:,}")
    print(f"Sitemap records exported: {len(sitemap_entries):,}")
    print(f"Output folder: {SCHOOL_PROFILE_OUTPUT_DIR}")
    print(f"Sitemap file: {SCHOOL_PROFILE_SITEMAP_OUTPUT_PATH}")
