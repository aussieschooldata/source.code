DROP VIEW IF EXISTS geo.xv_suburb_school_2km;

CREATE VIEW geo.xv_suburb_school_2km AS
WITH sal_shape AS MATERIALIZED (
    SELECT
        TRY_CAST(SAL_CODE21 AS INTEGER) AS sal_code,
        geom,
        ST_Transform(
            geom,
            'EPSG:7844',
            'EPSG:3577',
            always_xy := true
        ) AS geom_3577
    FROM geo.xv_sal_2021
    WHERE REGEXP_MATCHES(SAL_CODE21, '^[0-9]+$')
),

suburb AS MATERIALIZED (
    SELECT
        ss.sal_code,
        ss.suburb,
        ss.state,
        ss.postcode,
        ss.latitude  AS suburb_latitude,
        ss.longitude AS suburb_longitude,
        x.geom AS suburb_geom,
        x.geom_3577 AS suburb_geom_3577
    FROM geo.sal_suburb ss
    JOIN sal_shape x
      ON ss.sal_code = x.sal_code
),

school AS MATERIALIZED (
    SELECT
        sl.acara_sml_id,
        sl.school_age_id,
        sl.rolled_school_id,
        sl.school_name,
        sl.school_sector,
        sl.school_type,
        sl.special_school_flag,
        sl.campus_type,
        sl.latitude  AS school_latitude,
        sl.longitude AS school_longitude,
        ST_Point(sl.longitude, sl.latitude) AS school_point,
        ST_Transform(
            ST_Point(sl.longitude, sl.latitude),
            'EPSG:7844',
            'EPSG:3577',
            always_xy := true
        ) AS school_point_3577
    FROM school.school_location sl
    WHERE sl.latitude IS NOT NULL
      AND sl.longitude IS NOT NULL
),

candidate AS MATERIALIZED (
    SELECT
        s.*,
        sch.*
    FROM suburb s
    JOIN school sch
      ON sch.school_latitude BETWEEN s.suburb_latitude - 0.25 AND s.suburb_latitude + 0.25
     AND sch.school_longitude BETWEEN s.suburb_longitude - 0.25 AND s.suburb_longitude + 0.25
)

SELECT
    c.sal_code,
    c.suburb,
    c.state,
    c.postcode,

    c.school_latitude,
    c.school_longitude,

    c.acara_sml_id,
    c.school_age_id,
    c.rolled_school_id,
    c.school_name,
    c.school_sector,
    c.school_type,
    c.special_school_flag,
    c.campus_type,

    CASE
        WHEN ST_Intersects(c.suburb_geom, c.school_point)
            THEN NULL
        ELSE ROUND(
            ST_Distance(
                ST_Boundary(c.suburb_geom_3577),
                c.school_point_3577
            ) / 1000,
            3
        )
    END AS distance_from_suburb

FROM candidate c
WHERE
    ST_Intersects(c.suburb_geom, c.school_point)
    OR ST_Distance(
        ST_Boundary(c.suburb_geom_3577),
        c.school_point_3577
    ) <= 2000;