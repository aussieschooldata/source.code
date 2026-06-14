CREATE TABLE geo.sal_suburb(
    calendar_year INTEGER DEFAULT(9999),
    sal_code INTEGER,
    suburb VARCHAR,
    state VARCHAR,
    postcode VARCHAR,
    latitude DOUBLE,
    longitude DOUBLE,
    PRIMARY KEY(calendar_year, sal_code)
);