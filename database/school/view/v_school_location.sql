CREATE VIEW school.v_school_location AS
SELECT
    calendar_year,
    acara_sml_id,
    location_age_id,
    school_age_id,
    rolled_school_id,
    school_name,
    suburb,
    state,
    postcode,
    school_sector,
    school_type,
    special_school_flag,
    campus_type,
    latitude,
    longitude,
    abs_ra_code,
    abs_ra_name,
    meshblock_code,
    sa1_code,
    sa2_code,
    sa2_name,
    sa3_code,
    sa3_name,
    sa4_code,
    sa4_name,
    CASE
        WHEN ((sa4_name = 'Australian Capital Territory')) THEN ('Canberra')
        WHEN ((sa4_name ~~ '%Sydney%')) THEN ('Sydney')
        WHEN ((sa4_name ~~ '%Melbourne%')) THEN ('Melbourne')
        WHEN ((sa4_name ~~ '%Brisbane%')) THEN ('Brisbane')
        WHEN ((sa4_name ~~ '%Perth%')) THEN ('Perth')
        WHEN ((sa4_name ~~ '%Adelaide%')) THEN ('Adelaide')
        WHEN ((sa4_name ~~ 'Darwin%')) THEN ('Darwin')
        WHEN ((sa4_name ~~ '%Hobart%')) THEN ('Hobart')
        ELSE 'Other'
    END AS capital_city,
    lga_code,
    lga_name,
    state_ed_code,
    state_ed_name,
    cth_ed_code,
    cth_ed_name,
    CASE
        WHEN ((calendar_year = max(calendar_year) OVER (PARTITION BY acara_sml_id))) THEN (1)
        ELSE 0
    END AS is_latest
FROM
    school.school_location;
