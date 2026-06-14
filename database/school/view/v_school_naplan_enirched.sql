CREATE VIEW school.v_school_naplan_enriched AS
WITH BASE AS (
SELECT
    r.calendar_year,
    r.acara_sml_id,
    r.y3_read,
    r.y3_write,
    r.y3_spell,
    r.y3_grammar,
    r.y3_math,
    CASE
        WHEN (((r.y3_read IS NOT NULL)
        AND (r.y3_write IS NOT NULL)
        AND (r.y3_spell IS NOT NULL)
        AND (r.y3_grammar IS NOT NULL)
        AND (r.y3_math IS NOT NULL))) THEN ((((((r.y3_read + r.y3_write) + r.y3_spell) + r.y3_grammar) + r.y3_math) / 5.0))
        ELSE NULL
    END AS y3_avg,
    r.y5_read,
    r.y5_write,
    r.y5_spell,
    r.y5_grammar,
    r.y5_math,
    CASE
        WHEN (((r.y5_read IS NOT NULL)
        AND (r.y5_write IS NOT NULL)
        AND (r.y5_spell IS NOT NULL)
        AND (r.y5_grammar IS NOT NULL)
        AND (r.y5_math IS NOT NULL))) THEN ((((((r.y5_read + r.y5_write) + r.y5_spell) + r.y5_grammar) + r.y5_math) / 5.0))
        ELSE NULL
    END AS y5_avg,
    r.y7_read,
    r.y7_write,
    r.y7_spell,
    r.y7_grammar,
    r.y7_math,
    CASE
        WHEN (((r.y7_read IS NOT NULL)
        AND (r.y7_write IS NOT NULL)
        AND (r.y7_spell IS NOT NULL)
        AND (r.y7_grammar IS NOT NULL)
        AND (r.y7_math IS NOT NULL))) THEN ((((((r.y7_read + r.y7_write) + r.y7_spell) + r.y7_grammar) + r.y7_math) / 5.0))
        ELSE NULL
    END AS y7_avg,
    r.y9_read,
    r.y9_write,
    r.y9_spell,
    r.y9_grammar,
    r.y9_math,
    CASE
        WHEN (((r.y9_read IS NOT NULL)
        AND (r.y9_write IS NOT NULL)
        AND (r.y9_spell IS NOT NULL)
        AND (r.y9_grammar IS NOT NULL)
        AND (r.y9_math IS NOT NULL))) THEN ((((((r.y9_read + r.y9_write) + r.y9_spell) + r.y9_grammar) + r.y9_math) / 5.0))
        ELSE NULL
    END AS y9_avg
FROM
    school.school_naplan_results AS r),
BASE_WITH_PERCENTILES AS (
SELECT
    b.*,
    quantile(b.y3_avg, 0.02) OVER (PARTITION BY b.calendar_year) AS y3_p02_score,
    quantile(b.y3_avg, 0.98) OVER (PARTITION BY b.calendar_year) AS y3_p98_score,
    quantile(b.y5_avg, 0.02) OVER (PARTITION BY b.calendar_year) AS y5_p02_score,
    quantile(b.y5_avg, 0.98) OVER (PARTITION BY b.calendar_year) AS y5_p98_score,
    quantile(b.y7_avg, 0.02) OVER (PARTITION BY b.calendar_year) AS y7_p02_score,
    quantile(b.y7_avg, 0.98) OVER (PARTITION BY b.calendar_year) AS y7_p98_score,
    quantile(b.y9_avg, 0.02) OVER (PARTITION BY b.calendar_year) AS y9_p02_score,
    quantile(b.y9_avg, 0.98) OVER (PARTITION BY b.calendar_year) AS y9_p98_score
FROM
    BASE AS b),
BASE_OUTLIER_SMOOTHED AS (
SELECT
    bp.*,
    CASE
        WHEN ((bp.y3_avg IS NULL)) THEN (NULL)
        WHEN ((bp.y3_avg < bp.y3_p02_score)) THEN (bp.y3_p02_score)
        WHEN ((bp.y3_avg > bp.y3_p98_score)) THEN ((bp.y3_p98_score + ((bp.y3_avg - bp.y3_p98_score) * 0.2)))
        ELSE bp.y3_avg
    END AS y3_avg_smoothed,
    CASE
        WHEN ((bp.y5_avg IS NULL)) THEN (NULL)
        WHEN ((bp.y5_avg < bp.y5_p02_score)) THEN (bp.y5_p02_score)
        WHEN ((bp.y5_avg > bp.y5_p98_score)) THEN ((bp.y5_p98_score + ((bp.y5_avg - bp.y5_p98_score) * 0.2)))
        ELSE bp.y5_avg
    END AS y5_avg_smoothed,
    CASE
        WHEN ((bp.y7_avg IS NULL)) THEN (NULL)
        WHEN ((bp.y7_avg < bp.y7_p02_score)) THEN (bp.y7_p02_score)
        WHEN ((bp.y7_avg > bp.y7_p98_score)) THEN ((bp.y7_p98_score + ((bp.y7_avg - bp.y7_p98_score) * 0.2)))
        ELSE bp.y7_avg
    END AS y7_avg_smoothed,
    CASE
        WHEN ((bp.y9_avg IS NULL)) THEN (NULL)
        WHEN ((bp.y9_avg < bp.y9_p02_score)) THEN (bp.y9_p02_score)
        WHEN ((bp.y9_avg > bp.y9_p98_score)) THEN ((bp.y9_p98_score + ((bp.y9_avg - bp.y9_p98_score) * 0.2)))
        ELSE bp.y9_avg
    END AS y9_avg_smoothed
FROM
    BASE_WITH_PERCENTILES AS bp),
Z AS (
SELECT
    t.*,
    CASE
        WHEN ((t.y3_avg_smoothed IS NULL)) THEN (NULL)
        ELSE ((t.y3_avg_smoothed - avg(t.y3_avg_smoothed) OVER (PARTITION BY t.calendar_year)) / "nullif"(stddev_pop(t.y3_avg_smoothed) OVER (PARTITION BY t.calendar_year),
        0))
    END AS y3z,
    CASE
        WHEN ((t.y5_avg_smoothed IS NULL)) THEN (NULL)
        ELSE ((t.y5_avg_smoothed - avg(t.y5_avg_smoothed) OVER (PARTITION BY t.calendar_year)) / "nullif"(stddev_pop(t.y5_avg_smoothed) OVER (PARTITION BY t.calendar_year),
        0))
    END AS y5z,
    CASE
        WHEN ((t.y7_avg_smoothed IS NULL)) THEN (NULL)
        ELSE ((t.y7_avg_smoothed - avg(t.y7_avg_smoothed) OVER (PARTITION BY t.calendar_year)) / "nullif"(stddev_pop(t.y7_avg_smoothed) OVER (PARTITION BY t.calendar_year),
        0))
    END AS y7z,
    CASE
        WHEN ((t.y9_avg_smoothed IS NULL)) THEN (NULL)
        ELSE ((t.y9_avg_smoothed - avg(t.y9_avg_smoothed) OVER (PARTITION BY t.calendar_year)) / "nullif"(stddev_pop(t.y9_avg_smoothed) OVER (PARTITION BY t.calendar_year),
        0))
    END AS y9z
FROM
    BASE_OUTLIER_SMOOTHED AS t),
Z_BOUNDS AS (
SELECT
    z.*,
    min(z.y3z) OVER (PARTITION BY z.calendar_year) AS y3z_min,
    max(z.y3z) OVER (PARTITION BY z.calendar_year) AS y3z_max,
    min(z.y5z) OVER (PARTITION BY z.calendar_year) AS y5z_min,
    max(z.y5z) OVER (PARTITION BY z.calendar_year) AS y5z_max,
    min(z.y7z) OVER (PARTITION BY z.calendar_year) AS y7z_min,
    max(z.y7z) OVER (PARTITION BY z.calendar_year) AS y7z_max,
    min(z.y9z) OVER (PARTITION BY z.calendar_year) AS y9z_min,
    max(z.y9z) OVER (PARTITION BY z.calendar_year) AS y9z_max
FROM
    Z AS z),
BYR AS (
SELECT
    b.*,
    CASE
        WHEN ((b.y3z IS NULL)) THEN (NULL)
        ELSE ((((b.y3z + abs(b.y3z_min)) / "nullif"((b.y3z_max - b.y3z_min),
        0)) * 9) + 1)
    END AS y3_zrating,
    CASE
        WHEN ((b.y5z IS NULL)) THEN (NULL)
        ELSE ((((b.y5z + abs(b.y5z_min)) / "nullif"((b.y5z_max - b.y5z_min),
        0)) * 9) + 1)
    END AS y5_zrating,
    CASE
        WHEN ((b.y7z IS NULL)) THEN (NULL)
        ELSE ((((b.y7z + abs(b.y7z_min)) / "nullif"((b.y7z_max - b.y7z_min),
        0)) * 9) + 1)
    END AS y7_zrating,
    CASE
        WHEN ((b.y9z IS NULL)) THEN (NULL)
        ELSE ((((b.y9z + abs(b.y9z_min)) / "nullif"((b.y9z_max - b.y9z_min),
        0)) * 9) + 1)
    END AS y9_zrating
FROM
    Z_BOUNDS AS b),
BASE_WITH_FINAL_RATINGS AS (
SELECT
    b.*,
    CASE
        WHEN (((sp.state = 'SA')
        AND (b.calendar_year < 2022)
        AND (((CASE
            WHEN ((b.y3_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END + CASE
            WHEN ((b.y5_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END) + CASE
            WHEN ((b.y7_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END) > 0))) THEN ((((COALESCE(b.y3_zrating, 0) + COALESCE(b.y5_zrating, 0)) + COALESCE(b.y7_zrating, 0)) / ((CASE
            WHEN ((b.y3_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END + CASE
            WHEN ((b.y5_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END) + CASE
            WHEN ((b.y7_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END)))
        WHEN (((CASE
            WHEN ((b.y3_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END + CASE
            WHEN ((b.y5_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END) > 0)) THEN (((COALESCE(b.y3_zrating, 0) + COALESCE(b.y5_zrating, 0)) / (CASE
            WHEN ((b.y3_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END + CASE
            WHEN ((b.y5_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END)))
        ELSE NULL
    END AS primary_rating,
    CASE
        WHEN (((sp.state = 'SA')
        AND (b.calendar_year < 2022)
        AND (b.y9_zrating IS NOT NULL))) THEN (b.y9_zrating)
        WHEN (((CASE
            WHEN ((b.y7_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END + CASE
            WHEN ((b.y9_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END) > 0)) THEN (((COALESCE(b.y7_zrating, 0) + COALESCE(b.y9_zrating, 0)) / (CASE
            WHEN ((b.y7_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END + CASE
            WHEN ((b.y9_zrating IS NOT NULL)) THEN (1)
            ELSE 0
        END)))
        ELSE NULL
    END AS secondary_rating
FROM
    BYR AS b
INNER JOIN school.school_profile AS sp ON
    (((b.acara_sml_id = sp.acara_sml_id)
        AND (b.calendar_year = sp.calendar_year)))),
ENRICHED AS (
SELECT
    b.calendar_year,
    b.acara_sml_id,
    sp.school_name,
    sp.suburb,
    sp.state,
    sp.postcode,
    sp.campus_type,
    sp.reporting_type,
    sp.school_sector,
    ss.selective_status,
    ss.fully_selective,
    sp.school_type,
    sp.year_range,
    sp.icsea_score,
    sp.icsea_percentile,
    sp.sea_bottom_pct,
    sp.sea_lower_mid_pct,
    sp.sea_upper_mid_pct,
    sp.sea_top_pct,
    sp.teaching_staff_fte,
    sp.total_enrolments,
    sp.girls_enrolments,
    sp.boys_enrolments,
    round(CASE WHEN ((sp.total_enrolments > 0)) THEN (((sp.boys_enrolments * 100.0) / sp.total_enrolments)) ELSE NULL END, 0) AS boys_enrol_pct,
    round(CASE WHEN ((sp.total_enrolments > 0)) THEN (((sp.girls_enrolments * 100.0) / sp.total_enrolments)) ELSE NULL END, 0) AS girls_enrol_pct,
    sp.indigenous_enrol_pct,
    sp.lbote_yes_pct,
    sl.latitude,
    sl.longitude,
    sl.sa2_name,
    sl.sa3_name,
    sl.sa4_name,
    sl.lga_name,
    sl.abs_ra_name,
    sl.capital_city,
    CASE
        WHEN (((sp.state = 'TAS')
            AND (sl.abs_ra_name IN ('Inner Regional', 'Outer Regional')))) THEN (1)
        WHEN (((sp.state = 'NT')
            AND (sl.capital_city != 'Other'))) THEN (1)
        WHEN ((sl.abs_ra_name IN ('Major Cities', 'Inner Regional'))) THEN (1)
        ELSE 0
    END AS is_mainstream_for_percentile,
    seg.y1_enrolments,
    seg.y2_enrolments,
    seg.y3_enrolments,
    seg.y4_enrolments,
    seg.y5_enrolments,
    seg.y6_enrolments,
    seg.y7_enrolments,
    seg.y8_enrolments,
    seg.y9_enrolments,
    seg.y10_enrolments,
    seg.y11_enrolments,
    seg.y12_enrolments,
    b.y3_read,
    b.y3_write,
    b.y3_spell,
    b.y3_grammar,
    b.y3_math,
    b.y3_avg,
    b.y3_avg_smoothed,
    round(b.y3_zrating, 3) AS y3_zrating,
    b.y5_read,
    b.y5_write,
    b.y5_spell,
    b.y5_grammar,
    b.y5_math,
    b.y5_avg,
    b.y5_avg_smoothed,
    round(b.y5_zrating, 3) AS y5_zrating,
    b.y7_read,
    b.y7_write,
    b.y7_spell,
    b.y7_grammar,
    b.y7_math,
    b.y7_avg,
    b.y7_avg_smoothed,
    round(b.y7_zrating, 3) AS y7_zrating,
    b.y9_read,
    b.y9_write,
    b.y9_spell,
    b.y9_grammar,
    b.y9_math,
    b.y9_avg,
    b.y9_avg_smoothed,
    round(b.y9_zrating, 3) AS y9_zrating,
    round(b.primary_rating, 3) AS primary_rating,
    round(b.secondary_rating, 3) AS secondary_rating,
    CASE
        WHEN (((b.primary_rating IS NOT NULL)
            AND ((sp.total_enrolments > 100)
                OR (sp.total_enrolments IS NULL)))) THEN (1)
        ELSE 0
    END AS is_primary_rank_eligible,
    CASE
        WHEN (((b.secondary_rating IS NOT NULL)
            AND ((sp.total_enrolments > 100)
                OR (sp.total_enrolments IS NULL)))) THEN (1)
        ELSE 0
    END AS is_secondary_rank_eligible,
    CASE
        WHEN (((b.primary_rating IS NOT NULL)
            AND (sp.icsea_score IS NOT NULL)
                AND ((sp.total_enrolments > 100)
                    OR (sp.total_enrolments IS NULL)))) THEN (1)
        ELSE 0
    END AS is_primary_icsea_peer_eligible,
    CASE
        WHEN (((b.secondary_rating IS NOT NULL)
            AND (sp.icsea_score IS NOT NULL)
                AND ((sp.total_enrolments > 100)
                    OR (sp.total_enrolments IS NULL)))) THEN (1)
        ELSE 0
    END AS is_secondary_icsea_peer_eligible
FROM
    BASE_WITH_FINAL_RATINGS AS b
INNER JOIN school.school_profile AS sp ON
    (((b.acara_sml_id = sp.acara_sml_id)
        AND (b.calendar_year = sp.calendar_year)))
INNER JOIN school.v_school_location AS sl ON
    (((b.acara_sml_id = sl.acara_sml_id)
        AND (sl.is_latest = 1)))
LEFT JOIN school.school_enrolment_by_grade AS seg ON
    (((b.acara_sml_id = seg.acara_sml_id)
        AND (b.calendar_year = seg.calendar_year)))
LEFT JOIN school.school_selective AS ss ON
    ((b.acara_sml_id = ss.school_id))),
PRIMARY_BROAD_RANKS AS (
SELECT
    e.calendar_year,
    e.acara_sml_id,
    dense_rank() OVER (PARTITION BY e.calendar_year
ORDER BY
    e.primary_rating DESC) AS primary_rank_au,
    dense_rank() OVER (PARTITION BY e.calendar_year,
    e.state
ORDER BY
    e.primary_rating DESC) AS primary_rank_state,
    dense_rank() OVER (PARTITION BY e.calendar_year,
    e.school_sector
ORDER BY
    e.primary_rating DESC) AS primary_rank_sector,
    dense_rank() OVER (PARTITION BY e.calendar_year,
    e.state,
    e.school_sector
ORDER BY
    e.primary_rating DESC) AS primary_rank_state_sector,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year ORDER BY e.primary_rating DESC)), 5) AS primary_pct_au,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year, e.state ORDER BY e.primary_rating DESC)), 5) AS primary_pct_state,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year, e.school_sector ORDER BY e.primary_rating DESC)), 5) AS primary_pct_sector,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year, e.state, e.school_sector ORDER BY e.primary_rating DESC)), 5) AS primary_pct_state_sector
FROM
    ENRICHED AS e
WHERE
    (e.is_primary_rank_eligible = 1)),
SECONDARY_BROAD_RANKS AS (
SELECT
    e.calendar_year,
    e.acara_sml_id,
    dense_rank() OVER (PARTITION BY e.calendar_year
ORDER BY
    e.secondary_rating DESC) AS secondary_rank_au,
    dense_rank() OVER (PARTITION BY e.calendar_year,
    e.state
ORDER BY
    e.secondary_rating DESC) AS secondary_rank_state,
    dense_rank() OVER (PARTITION BY e.calendar_year,
    e.school_sector
ORDER BY
    e.secondary_rating DESC) AS secondary_rank_sector,
    dense_rank() OVER (PARTITION BY e.calendar_year,
    e.state,
    e.school_sector
ORDER BY
    e.secondary_rating DESC) AS secondary_rank_state_sector,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year ORDER BY e.secondary_rating DESC)), 5) AS secondary_pct_au,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year, e.state ORDER BY e.secondary_rating DESC)), 5) AS secondary_pct_state,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year, e.school_sector ORDER BY e.secondary_rating DESC)), 5) AS secondary_pct_sector,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year, e.state, e.school_sector ORDER BY e.secondary_rating DESC)), 5) AS secondary_pct_state_sector
FROM
    ENRICHED AS e
WHERE
    (e.is_secondary_rank_eligible = 1)),
PRIMARY_MAINSTREAM_STATE_SECTOR_RANKS AS (
SELECT
    e.calendar_year,
    e.acara_sml_id,
    dense_rank() OVER (PARTITION BY e.calendar_year,
    e.state,
    e.school_sector
ORDER BY
    e.primary_rating DESC) AS primary_rank_mainstream_state_sector,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year, e.state, e.school_sector ORDER BY e.primary_rating DESC)), 5) AS primary_pct_mainstream_state_sector
FROM
    ENRICHED AS e
WHERE
    ((e.is_primary_rank_eligible = 1)
        AND (e.is_mainstream_for_percentile = 1))),
SECONDARY_MAINSTREAM_STATE_SECTOR_RANKS AS (
SELECT
    e.calendar_year,
    e.acara_sml_id,
    dense_rank() OVER (PARTITION BY e.calendar_year,
    e.state,
    e.school_sector
ORDER BY
    e.secondary_rating DESC) AS secondary_rank_mainstream_state_sector,
    round((1.0 - percent_rank() OVER (PARTITION BY e.calendar_year, e.state, e.school_sector ORDER BY e.secondary_rating DESC)), 5) AS secondary_pct_mainstream_state_sector
FROM
    ENRICHED AS e
WHERE
    ((e.is_secondary_rank_eligible = 1)
        AND (e.is_mainstream_for_percentile = 1))),
PRIMARY_PEER_STATE_SECTOR AS (
SELECT
    e1.calendar_year,
    e1.acara_sml_id,
    count_star() FILTER (
    WHERE (e2.is_primary_icsea_peer_eligible = 1)) AS primary_icsea_peer_count_state_sector,
    round(avg(e2.primary_rating) FILTER (WHERE (e2.is_primary_icsea_peer_eligible = 1)), 3) AS primary_icsea_avg_state_sector,
    round((e1.primary_rating - avg(e2.primary_rating) FILTER (WHERE (e2.is_primary_icsea_peer_eligible = 1))), 3) AS primary_rating_vs_icsea_avg_state_sector,
    (1 + count(DISTINCT e2.primary_rating) FILTER (
    WHERE ((e2.is_primary_icsea_peer_eligible = 1)
        AND (e2.primary_rating > e1.primary_rating)))) AS primary_rank_icsea_state_sector,
    round(CASE WHEN ((count_star() FILTER (WHERE (e2.is_primary_icsea_peer_eligible = 1)) <= 1)) THEN (NULL) ELSE (1.0 - ((count_star() FILTER (WHERE ((e2.is_primary_icsea_peer_eligible = 1) AND (e2.primary_rating > e1.primary_rating))) * 1.0) / (count_star() FILTER (WHERE (e2.is_primary_icsea_peer_eligible = 1)) - 1))) END, 5) AS primary_pct_icsea_state_sector
FROM
    ENRICHED AS e1
LEFT JOIN ENRICHED AS e2 ON
    (((e1.calendar_year = e2.calendar_year)
        AND (e1.state = e2.state)
            AND (e1.school_sector = e2.school_sector)
                AND (e1.icsea_score IS NOT NULL)
                    AND (e2.icsea_score IS NOT NULL)
                        AND (abs((e2.icsea_score - e1.icsea_score)) <= 25)))
WHERE
    (e1.is_primary_icsea_peer_eligible = 1)
GROUP BY
    e1.calendar_year,
    e1.acara_sml_id,
    e1.primary_rating),
PRIMARY_PEER_SECTOR AS (
SELECT
    e1.calendar_year,
    e1.acara_sml_id,
    count_star() FILTER (
    WHERE (e2.is_primary_icsea_peer_eligible = 1)) AS primary_icsea_peer_count_sector,
    round(avg(e2.primary_rating) FILTER (WHERE (e2.is_primary_icsea_peer_eligible = 1)), 3) AS primary_icsea_avg_sector,
    round((e1.primary_rating - avg(e2.primary_rating) FILTER (WHERE (e2.is_primary_icsea_peer_eligible = 1))), 3) AS primary_rating_vs_icsea_avg_sector,
    (1 + count(DISTINCT e2.primary_rating) FILTER (
    WHERE ((e2.is_primary_icsea_peer_eligible = 1)
        AND (e2.primary_rating > e1.primary_rating)))) AS primary_rank_icsea_sector,
    round(CASE WHEN ((count_star() FILTER (WHERE (e2.is_primary_icsea_peer_eligible = 1)) <= 1)) THEN (NULL) ELSE (1.0 - ((count_star() FILTER (WHERE ((e2.is_primary_icsea_peer_eligible = 1) AND (e2.primary_rating > e1.primary_rating))) * 1.0) / (count_star() FILTER (WHERE (e2.is_primary_icsea_peer_eligible = 1)) - 1))) END, 5) AS primary_pct_icsea_sector
FROM
    ENRICHED AS e1
LEFT JOIN ENRICHED AS e2 ON
    (((e1.calendar_year = e2.calendar_year)
        AND (e1.school_sector = e2.school_sector)
            AND (e1.icsea_score IS NOT NULL)
                AND (e2.icsea_score IS NOT NULL)
                    AND (abs((e2.icsea_score - e1.icsea_score)) <= 25)))
WHERE
    (e1.is_primary_icsea_peer_eligible = 1)
GROUP BY
    e1.calendar_year,
    e1.acara_sml_id,
    e1.primary_rating),
SECONDARY_PEER_STATE_SECTOR AS (
SELECT
    e1.calendar_year,
    e1.acara_sml_id,
    count_star() FILTER (
    WHERE (e2.is_secondary_icsea_peer_eligible = 1)) AS secondary_icsea_peer_count_state_sector,
    round(avg(e2.secondary_rating) FILTER (WHERE (e2.is_secondary_icsea_peer_eligible = 1)), 3) AS secondary_icsea_avg_state_sector,
    round((e1.secondary_rating - avg(e2.secondary_rating) FILTER (WHERE (e2.is_secondary_icsea_peer_eligible = 1))), 3) AS secondary_rating_vs_icsea_avg_state_sector,
    (1 + count(DISTINCT e2.secondary_rating) FILTER (
    WHERE ((e2.is_secondary_icsea_peer_eligible = 1)
        AND (e2.secondary_rating > e1.secondary_rating)))) AS secondary_rank_icsea_state_sector,
    round(CASE WHEN ((count_star() FILTER (WHERE (e2.is_secondary_icsea_peer_eligible = 1)) <= 1)) THEN (NULL) ELSE (1.0 - ((count_star() FILTER (WHERE ((e2.is_secondary_icsea_peer_eligible = 1) AND (e2.secondary_rating > e1.secondary_rating))) * 1.0) / (count_star() FILTER (WHERE (e2.is_secondary_icsea_peer_eligible = 1)) - 1))) END, 5) AS secondary_pct_icsea_state_sector
FROM
    ENRICHED AS e1
LEFT JOIN ENRICHED AS e2 ON
    (((e1.calendar_year = e2.calendar_year)
        AND (e1.state = e2.state)
            AND (e1.school_sector = e2.school_sector)
                AND (e1.icsea_score IS NOT NULL)
                    AND (e2.icsea_score IS NOT NULL)
                        AND (abs((e2.icsea_score - e1.icsea_score)) <= 25)))
WHERE
    (e1.is_secondary_icsea_peer_eligible = 1)
GROUP BY
    e1.calendar_year,
    e1.acara_sml_id,
    e1.secondary_rating),
SECONDARY_PEER_SECTOR AS (
SELECT
    e1.calendar_year,
    e1.acara_sml_id,
    count_star() FILTER (
    WHERE (e2.is_secondary_icsea_peer_eligible = 1)) AS secondary_icsea_peer_count_sector,
    round(avg(e2.secondary_rating) FILTER (WHERE (e2.is_secondary_icsea_peer_eligible = 1)), 3) AS secondary_icsea_avg_sector,
    round((e1.secondary_rating - avg(e2.secondary_rating) FILTER (WHERE (e2.is_secondary_icsea_peer_eligible = 1))), 3) AS secondary_rating_vs_icsea_avg_sector,
    (1 + count(DISTINCT e2.secondary_rating) FILTER (
    WHERE ((e2.is_secondary_icsea_peer_eligible = 1)
        AND (e2.secondary_rating > e1.secondary_rating)))) AS secondary_rank_icsea_sector,
    round(CASE WHEN ((count_star() FILTER (WHERE (e2.is_secondary_icsea_peer_eligible = 1)) <= 1)) THEN (NULL) ELSE (1.0 - ((count_star() FILTER (WHERE ((e2.is_secondary_icsea_peer_eligible = 1) AND (e2.secondary_rating > e1.secondary_rating))) * 1.0) / (count_star() FILTER (WHERE (e2.is_secondary_icsea_peer_eligible = 1)) - 1))) END, 5) AS secondary_pct_icsea_sector
FROM
    ENRICHED AS e1
LEFT JOIN ENRICHED AS e2 ON
    (((e1.calendar_year = e2.calendar_year)
        AND (e1.school_sector = e2.school_sector)
            AND (e1.icsea_score IS NOT NULL)
                AND (e2.icsea_score IS NOT NULL)
                    AND (abs((e2.icsea_score - e1.icsea_score)) <= 25)))
WHERE
    (e1.is_secondary_icsea_peer_eligible = 1)
GROUP BY
    e1.calendar_year,
    e1.acara_sml_id,
    e1.secondary_rating
)SELECT
    e.calendar_year,
    e.acara_sml_id,
    e.school_name,
    e.suburb,
    e.state,
    e.postcode,
    e.campus_type,
    e.reporting_type,
    e.school_sector,
    e.selective_status,
    e.fully_selective,
    e.school_type,
    e.year_range,
    e.icsea_score,
    e.icsea_percentile,
    e.sea_bottom_pct,
    e.sea_lower_mid_pct,
    e.sea_upper_mid_pct,
    e.sea_top_pct,
    e.teaching_staff_fte,
    e.total_enrolments,
    e.girls_enrolments,
    e.boys_enrolments,
    e.boys_enrol_pct,
    e.girls_enrol_pct,
    e.indigenous_enrol_pct,
    e.lbote_yes_pct,
    e.latitude,
    e.longitude,
    e.sa2_name,
    e.sa3_name,
    e.sa4_name,
    e.lga_name,
    e.abs_ra_name,
    e.capital_city,
    e.is_mainstream_for_percentile,
    e.y1_enrolments,
    e.y2_enrolments,
    e.y3_enrolments,
    e.y4_enrolments,
    e.y5_enrolments,
    e.y6_enrolments,
    e.y7_enrolments,
    e.y8_enrolments,
    e.y9_enrolments,
    e.y10_enrolments,
    e.y11_enrolments,
    e.y12_enrolments,
    e.y3_read,
    e.y3_write,
    e.y3_spell,
    e.y3_grammar,
    e.y3_math,
    e.y3_avg,
    e.y3_avg_smoothed,
    e.y3_zrating,
    e.y5_read,
    e.y5_write,
    e.y5_spell,
    e.y5_grammar,
    e.y5_math,
    e.y5_avg,
    e.y5_avg_smoothed,
    e.y5_zrating,
    e.y7_read,
    e.y7_write,
    e.y7_spell,
    e.y7_grammar,
    e.y7_math,
    e.y7_avg,
    e.y7_avg_smoothed,
    e.y7_zrating,
    e.y9_read,
    e.y9_write,
    e.y9_spell,
    e.y9_grammar,
    e.y9_math,
    e.y9_avg,
    e.y9_avg_smoothed,
    e.y9_zrating,
    e.primary_rating,
    e.secondary_rating,
    pr.primary_rank_au,
    pr.primary_rank_state,
    pr.primary_rank_sector,
    pr.primary_rank_state_sector,
    pr.primary_pct_au,
    CASE
        WHEN ((pr.primary_pct_au IS NULL)) THEN (NULL)
        WHEN ((pr.primary_pct_au >= 0.97)) THEN ('A+')
        WHEN ((pr.primary_pct_au >= 0.90)) THEN ('A')
        WHEN ((pr.primary_pct_au >= 0.70)) THEN ('B+')
        WHEN ((pr.primary_pct_au >= 0.55)) THEN ('B')
        WHEN ((pr.primary_pct_au >= 0.30)) THEN ('C')
        WHEN ((pr.primary_pct_au >= 0.10)) THEN ('D')
        ELSE 'E'
    END AS primary_grade_au,
    pr.primary_pct_state,
    pr.primary_pct_sector,
    pr.primary_pct_state_sector,
    mpr.primary_rank_mainstream_state_sector,
    mpr.primary_pct_mainstream_state_sector,
    sr.secondary_rank_au,
    sr.secondary_rank_state,
    sr.secondary_rank_sector,
    sr.secondary_rank_state_sector,
    sr.secondary_pct_au,
    CASE
        WHEN ((sr.secondary_pct_au IS NULL)) THEN (NULL)
        WHEN ((sr.secondary_pct_au >= 0.97)) THEN ('A+')
        WHEN ((sr.secondary_pct_au >= 0.90)) THEN ('A')
        WHEN ((sr.secondary_pct_au >= 0.70)) THEN ('B+')
        WHEN ((sr.secondary_pct_au >= 0.55)) THEN ('B')
        WHEN ((sr.secondary_pct_au >= 0.30)) THEN ('C')
        WHEN ((sr.secondary_pct_au >= 0.10)) THEN ('D')
        ELSE 'E'
    END AS secondary_grade_au,
    sr.secondary_pct_state,
    sr.secondary_pct_sector,
    sr.secondary_pct_state_sector,
    msr.secondary_rank_mainstream_state_sector,
    msr.secondary_pct_mainstream_state_sector,
    pss.primary_icsea_peer_count_state_sector,
    pss.primary_rating_vs_icsea_avg_state_sector,
    pss.primary_rank_icsea_state_sector,
    pss.primary_pct_icsea_state_sector,
    ps.primary_icsea_peer_count_sector,
    ps.primary_rating_vs_icsea_avg_sector,
    ps.primary_rank_icsea_sector,
    ps.primary_pct_icsea_sector,
    sss.secondary_icsea_peer_count_state_sector,
    sss.secondary_rating_vs_icsea_avg_state_sector,
    sss.secondary_rank_icsea_state_sector,
    sss.secondary_pct_icsea_state_sector,
    ss.secondary_icsea_peer_count_sector,
    ss.secondary_rating_vs_icsea_avg_sector,
    ss.secondary_rank_icsea_sector,
    ss.secondary_pct_icsea_sector,
    CASE
        WHEN ((e.calendar_year = max(e.calendar_year) OVER ())) THEN (1)
        ELSE 0
    END AS is_latest
FROM
    ENRICHED AS e
LEFT JOIN PRIMARY_BROAD_RANKS AS pr ON
    (((e.calendar_year = pr.calendar_year)
        AND (e.acara_sml_id = pr.acara_sml_id)))
LEFT JOIN SECONDARY_BROAD_RANKS AS sr ON
    (((e.calendar_year = sr.calendar_year)
        AND (e.acara_sml_id = sr.acara_sml_id)))
LEFT JOIN PRIMARY_MAINSTREAM_STATE_SECTOR_RANKS AS mpr ON
    (((e.calendar_year = mpr.calendar_year)
        AND (e.acara_sml_id = mpr.acara_sml_id)))
LEFT JOIN SECONDARY_MAINSTREAM_STATE_SECTOR_RANKS AS msr ON
    (((e.calendar_year = msr.calendar_year)
        AND (e.acara_sml_id = msr.acara_sml_id)))
LEFT JOIN PRIMARY_PEER_STATE_SECTOR AS pss ON
    (((e.calendar_year = pss.calendar_year)
        AND (e.acara_sml_id = pss.acara_sml_id)))
LEFT JOIN PRIMARY_PEER_SECTOR AS ps ON
    (((e.calendar_year = ps.calendar_year)
        AND (e.acara_sml_id = ps.acara_sml_id)))
LEFT JOIN SECONDARY_PEER_STATE_SECTOR AS sss ON
    (((e.calendar_year = sss.calendar_year)
        AND (e.acara_sml_id = sss.acara_sml_id)))
LEFT JOIN SECONDARY_PEER_SECTOR AS ss ON
    (((e.calendar_year = ss.calendar_year)
        AND (e.acara_sml_id = ss.acara_sml_id)));