from pathlib import Path


DUCKDB_PATH = r"C:\Data\duckdb\asd.duckdb"

SOURCE_TABLE = "main.mv_school_naplan_results_enriched_v2"
SCHOOL_PROFILE_COMMENTARY_TABLE = "main.v_school_profile_commentary"

OUTPUT_BASE_DIR = Path(r"C:\Git\school.data\search")
SCHOOL_PROFILE_OUTPUT_DIR = Path(r"C:\Git\school.data\school-profile")
SCHOOL_PROFILE_SITEMAP_OUTPUT_PATH = Path(r"C:\Git\school.data\school-profile-sitemap.json")

COLUMN_MAP = {
    "acara_sml_id": "id",
    "school_name": "n",
    "suburb": "su",
    "state": "st",
    "school_sector": "se",
    "year_range": "yr",
    "icsea_score": "is",
    "icsea_percentile": "ip",
    "total_enrolments": "en",
    "primary_rating": "pr",
    "secondary_rating": "sr",
}
