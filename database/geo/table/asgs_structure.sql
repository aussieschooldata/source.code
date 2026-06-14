CREATE TABLE geo.asgs_structure(
    calendar_year INTEGER DEFAULT(9999),
    asgs_structure VARCHAR,
    census_code VARCHAR,
    asgs_code VARCHAR,
    census_name VARCHAR,
    area_sqkm DECIMAL(18, 6),
    PRIMARY KEY(calendar_year, asgs_structure, asgs_code)
);