from pathlib import Path

import pandas as pd

from src.com.config.settings import (
    COLUMN_MAP,
    DUCKDB_PATH,
    OUTPUT_BASE_DIR,
    SOURCE_TABLE,
)
from src.com.tools.duckdb_client import read_duckdb_query
from src.com.tools.json_writer import write_minified_json


def build_school_search_sql() -> str:
    columns = ",\n        ".join(COLUMN_MAP.keys())

    return f"""
        SELECT
            {columns}
        FROM {SOURCE_TABLE}
        WHERE is_latest = 1
          AND (
                primary_rating IS NOT NULL
                OR secondary_rating IS NOT NULL
              )
    """


def extract_school_data() -> pd.DataFrame:
    sql = build_school_search_sql()
    return read_duckdb_query(DUCKDB_PATH, sql)


def rename_columns(df: pd.DataFrame) -> pd.DataFrame:
    return df.rename(columns=COLUMN_MAP)


def normalise_state(df: pd.DataFrame) -> pd.DataFrame:
    df = df.copy()
    df["st"] = df["st"].astype(str).str.upper()
    return df


def dataframe_to_records(df: pd.DataFrame) -> list[dict]:
    df = df.copy()

    # Force pandas NaN/NA values into real Python None
    df = df.astype(object).where(pd.notnull(df), None)

    return df.to_dict(orient="records")


def write_all_file(df: pd.DataFrame) -> None:
    output_df = df.sort_values(["st", "n"], na_position="last")
    records = dataframe_to_records(output_df)

    write_minified_json(
        records,
        OUTPUT_BASE_DIR / "all.json"
    )


def write_state_files(df: pd.DataFrame) -> None:
    for state, state_df in df.groupby("st"):
        state_code = str(state).lower()

        output_df = state_df.sort_values("n", na_position="last")
        records = dataframe_to_records(output_df)

        write_minified_json(
            records,
            OUTPUT_BASE_DIR / "state" / f"{state_code}.json"
        )


def write_state_type_files(df: pd.DataFrame) -> None:
    variants = {
        "primary": df[df["pr"].notnull()],
        "secondary": df[df["sr"].notnull()],
    }

    for school_type, type_df in variants.items():
        for state, state_df in type_df.groupby("st"):
            state_code = str(state).lower()

            output_df = state_df.sort_values("n", na_position="last")
            records = dataframe_to_records(output_df)

            write_minified_json(
                records,
                OUTPUT_BASE_DIR / "type" / school_type / f"{state_code}.json"
            )


def run_school_search_pipeline() -> None:
    df = extract_school_data()
    df = rename_columns(df)
    df = normalise_state(df)

    write_all_file(df)
    write_state_files(df)
    write_state_type_files(df)

    print("School search JSON generation completed.")
    print(f"Records exported: {len(df):,}")
    print(f"Output folder: {OUTPUT_BASE_DIR}")
