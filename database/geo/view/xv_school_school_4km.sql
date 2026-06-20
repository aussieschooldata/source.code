DROP VIEW IF EXISTS geo.xv_school_school_4km;

CREATE VIEW geo.xv_school_school_4km AS

WITH school AS MATERIALIZED (

    SELECT
        sp.calendar_year,
        sp.acara_sml_id,
        sp.location_age_id,
        sp.school_age_id,
        sl.rolled_school_id,

        sp.school_name,
        sp.school_sector,
        sp.school_type,
        sl.special_school_flag,
        sp.campus_type,
        sl.campus_type AS location_campus_type,
        sp.reporting_type,

        sp.suburb,
        sp.state,
        sp.postcode,

        sl.latitude  AS school_latitude,
        sl.longitude AS school_longitude,

        ST_Transform(
            ST_Point(sl.longitude, sl.latitude),
            'EPSG:7844',
            'EPSG:3577',
            always_xy := true
        ) AS school_point_3577

    FROM school.school_profile sp

    INNER JOIN school.school_location sl
      ON sp.calendar_year    = sl.calendar_year
     AND sp.acara_sml_id     = sl.acara_sml_id
     AND sp.location_age_id  = sl.location_age_id

    WHERE sp.calendar_year = sl.calendar_year

      AND sl.latitude IS NOT NULL
      AND sl.longitude IS NOT NULL
),

candidate AS MATERIALIZED (

    SELECT
        s1.*,

        s2.acara_sml_id        AS nearby_school_id,
        s2.location_age_id     AS nearby_location_age_id,
        s2.school_age_id       AS nearby_school_age_id,
        s2.rolled_school_id    AS nearby_rolled_school_id,

        s2.school_name         AS nearby_school_name,
        s2.school_sector       AS nearby_school_sector,
        s2.school_type         AS nearby_school_type,
        s2.special_school_flag AS nearby_special_school_flag,
        s2.campus_type         AS nearby_campus_type,
        s2.location_campus_type AS nearby_location_campus_type,
        s2.reporting_type      AS nearby_reporting_type,

        s2.suburb              AS nearby_suburb,
        s2.state               AS nearby_state,
        s2.postcode            AS nearby_postcode,

        s2.school_latitude     AS nearby_school_latitude,
        s2.school_longitude    AS nearby_school_longitude,
        s2.school_point_3577   AS nearby_school_point_3577

    FROM school s1

    INNER JOIN school s2
      ON s1.acara_sml_id <> s2.acara_sml_id
     AND s1.calendar_year = s2.calendar_year

     AND (
            (
                s1.suburb = s2.suburb
            AND s1.postcode = s2.postcode
            AND s1.state = s2.state
            )

            OR

            (
                s2.school_latitude
                    BETWEEN s1.school_latitude - 0.05
                        AND s1.school_latitude + 0.05

            AND s2.school_longitude
                    BETWEEN s1.school_longitude - 0.05
                        AND s1.school_longitude + 0.05
            )
         )

)

SELECT
    c.calendar_year,

    c.acara_sml_id AS school_id,
    c.location_age_id,
    c.school_age_id,
    c.rolled_school_id,

    c.school_name,
    c.school_sector,
    c.school_type,
    c.special_school_flag,
    c.campus_type,
    c.location_campus_type,
    c.reporting_type,

    c.suburb,
    c.state,
    c.postcode,

    c.school_latitude,
    c.school_longitude,

    c.nearby_school_id,
    c.nearby_location_age_id,
    c.nearby_school_age_id,
    c.nearby_rolled_school_id,

    c.nearby_school_name,
    c.nearby_school_sector,
    c.nearby_school_type,
    c.nearby_special_school_flag,
    c.nearby_campus_type,
    c.nearby_location_campus_type,
    c.nearby_reporting_type,

    c.nearby_suburb,
    c.nearby_state,
    c.nearby_postcode,

    c.nearby_school_latitude,
    c.nearby_school_longitude,

    ROUND(
        ST_Distance(
            c.school_point_3577,
            c.nearby_school_point_3577
        ) / 1000,
        3
    ) AS distance_from_school,

    CASE
        WHEN c.suburb = c.nearby_suburb
         AND c.postcode = c.nearby_postcode
         AND c.state = c.nearby_state
        THEN TRUE
        ELSE FALSE
    END AS same_suburb_postcode,

    CASE
        WHEN (c.school_type = C.nearby_school_type
          OR C.school_type = 'Combined' AND c.nearby_school_type <> 'Special'
          OR c.nearby_school_type = 'Combined')
         AND c.school_type <> 'Special'
        THEN TRUE
        WHEN c.school_type = 'Special'
        THEN NULL
        ELSE FALSE
    END AS relevant_school_type

FROM candidate c

WHERE
    (
        c.suburb = c.nearby_suburb
    AND c.postcode = c.nearby_postcode
    AND c.state = c.nearby_state
    )

    OR

    ST_Distance(
        c.school_point_3577,
        c.nearby_school_point_3577
    ) <= 4000;


CREATE OR REPLACE TABLE geo.mv_school_school_4km AS
SELECT * FROM geo.xv_school_school_4km;
