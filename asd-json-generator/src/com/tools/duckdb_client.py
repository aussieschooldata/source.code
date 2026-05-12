import duckdb
import pandas as pd


def read_duckdb_query(db_path: str, sql: str) -> pd.DataFrame:
    with duckdb.connect(db_path, read_only=True) as con:
        return con.execute(sql).fetchdf()
