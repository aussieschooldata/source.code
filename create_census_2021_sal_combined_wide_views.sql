-- Auto-generated DuckDB DDL for combined/wide ABS 2021 Census GCP SAL views
-- These views join split topic files (e.g. G09A..G09H) by SAL_CODE_2021.
-- Depends on the external CSV views created in create_census_2021_sal_external_views.sql.

CREATE SCHEMA IF NOT EXISTS census;

-- G04 combined | Age by Sex
-- Source tables: G04A, G04B
CREATE OR REPLACE VIEW census.xv_2021_g04_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g04a_age_sex_sal AS t1
INNER JOIN census.xv_2021_g04b_age_sex_sal AS t2
    USING (SAL_CODE_2021);

-- G09 combined | Country of Birth of Person by Age by Sex
-- Source tables: G09A, G09B, G09C, G09D, G09E, G09F, G09G, G09H
CREATE OR REPLACE VIEW census.xv_2021_g09_country_birth_person_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021),
    t4.* EXCLUDE (SAL_CODE_2021),
    t5.* EXCLUDE (SAL_CODE_2021),
    t6.* EXCLUDE (SAL_CODE_2021),
    t7.* EXCLUDE (SAL_CODE_2021),
    t8.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g09a_country_birth_person_age_sex_sal AS t1
INNER JOIN census.xv_2021_g09b_country_birth_person_age_sex_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g09c_country_birth_person_age_sex_sal AS t3
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g09d_country_birth_person_age_sex_sal AS t4
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g09e_country_birth_person_age_sex_sal AS t5
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g09f_country_birth_person_age_sex_sal AS t6
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g09g_country_birth_person_age_sex_sal AS t7
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g09h_country_birth_person_age_sex_sal AS t8
    USING (SAL_CODE_2021);

-- G10 combined | Country of Birth of Person by Year of Arrival in Australia
-- Source tables: G10A, G10B, G10C
CREATE OR REPLACE VIEW census.xv_2021_g10_country_birth_person_year_arrival_australia_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g10a_country_birth_person_year_arrival_australia_sal AS t1
INNER JOIN census.xv_2021_g10b_country_birth_person_year_arrival_australia_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g10c_country_birth_person_year_arrival_australia_sal AS t3
    USING (SAL_CODE_2021);

-- G11 combined | Proficiency in Spoken English by Year of Arrival in Australia by Age
-- Source tables: G11A, G11B, G11C, G11D
CREATE OR REPLACE VIEW census.xv_2021_g11_proficiency_spoken_english_year_arrival_australia_age_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021),
    t4.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g11a_proficiency_spoken_english_year_arrival_australia_age_sal AS t1
INNER JOIN census.xv_2021_g11b_proficiency_spoken_english_year_arrival_australia_age_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g11c_proficiency_spoken_english_year_arrival_australia_age_sal AS t3
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g11d_proficiency_spoken_english_year_arrival_australia_age_sal AS t4
    USING (SAL_CODE_2021);

-- G12 combined | Proficiency in Spoken English of Parents by Age of Dependent Children
-- Source tables: G12A, G12B
CREATE OR REPLACE VIEW census.xv_2021_g12_proficiency_spoken_english_parents_age_dependent_childr_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g12a_proficiency_spoken_english_parents_age_dependent_childr_sal AS t1
INNER JOIN census.xv_2021_g12b_proficiency_spoken_english_parents_age_dependent_childr_sal AS t2
    USING (SAL_CODE_2021);

-- G13 combined | Language Used at Home by Proficiency in Spoken English by Sex
-- Source tables: G13A, G13B, G13C, G13D, G13E
CREATE OR REPLACE VIEW census.xv_2021_g13_language_used_at_home_proficiency_spoken_english_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021),
    t4.* EXCLUDE (SAL_CODE_2021),
    t5.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g13a_language_used_at_home_proficiency_spoken_english_sex_sal AS t1
INNER JOIN census.xv_2021_g13b_language_used_at_home_proficiency_spoken_english_sex_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g13c_language_used_at_home_proficiency_spoken_english_sex_sal AS t3
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g13d_language_used_at_home_proficiency_spoken_english_sex_sal AS t4
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g13e_language_used_at_home_proficiency_spoken_english_sex_sal AS t5
    USING (SAL_CODE_2021);

-- G16 combined | Highest Year of School Completed by Age by Sex
-- Source tables: G16A, G16B
CREATE OR REPLACE VIEW census.xv_2021_g16_highest_year_school_completed_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g16a_highest_year_school_completed_age_sex_sal AS t1
INNER JOIN census.xv_2021_g16b_highest_year_school_completed_age_sex_sal AS t2
    USING (SAL_CODE_2021);

-- G17 combined | Total Personal Income (Weekly) by Age by Sex
-- Source tables: G17A, G17B, G17C
CREATE OR REPLACE VIEW census.xv_2021_g17_total_personal_income_weekly_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g17a_total_personal_income_weekly_age_sex_sal AS t1
INNER JOIN census.xv_2021_g17b_total_personal_income_weekly_age_sex_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g17c_total_personal_income_weekly_age_sex_sal AS t3
    USING (SAL_CODE_2021);

-- G19 combined | Type of Long-Term Health Condition by Age by Sex
-- Source tables: G19A, G19B, G19C
CREATE OR REPLACE VIEW census.xv_2021_g19_type_long_term_health_condition_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g19a_type_long_term_health_condition_age_sex_sal AS t1
INNER JOIN census.xv_2021_g19b_type_long_term_health_condition_age_sex_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g19c_type_long_term_health_condition_age_sex_sal AS t3
    USING (SAL_CODE_2021);

-- G20 combined | Count of Selected Long-Term Health Conditions by Age by Sex
-- Source tables: G20A, G20B
CREATE OR REPLACE VIEW census.xv_2021_g20_count_selected_long_term_health_conditions_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g20a_count_selected_long_term_health_conditions_age_sex_sal AS t1
INNER JOIN census.xv_2021_g20b_count_selected_long_term_health_conditions_age_sex_sal AS t2
    USING (SAL_CODE_2021);

-- G21 combined | Type of Long-Term Health Condition by Selected Person Characteristics
-- Source tables: G21A, G21B, G21C
CREATE OR REPLACE VIEW census.xv_2021_g21_type_long_term_health_condition_selected_person_charact_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g21a_type_long_term_health_condition_selected_person_charact_sal AS t1
INNER JOIN census.xv_2021_g21b_type_long_term_health_condition_selected_person_charact_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g21c_type_long_term_health_condition_selected_person_charact_sal AS t3
    USING (SAL_CODE_2021);

-- G24 combined | Unpaid Domestic Work:  Number of Hours by Age by Sex
-- Source tables: G24A, G24B
CREATE OR REPLACE VIEW census.xv_2021_g24_unpaid_domestic_work_number_hours_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g24a_unpaid_domestic_work_number_hours_age_sex_sal AS t1
INNER JOIN census.xv_2021_g24b_unpaid_domestic_work_number_hours_age_sex_sal AS t2
    USING (SAL_CODE_2021);

-- G26 combined | Unpaid Child Care by Age by Sex
-- Source tables: G26A, G26B
CREATE OR REPLACE VIEW census.xv_2021_g26_unpaid_child_care_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g26a_unpaid_child_care_age_sex_sal AS t1
INNER JOIN census.xv_2021_g26b_unpaid_child_care_age_sex_sal AS t2
    USING (SAL_CODE_2021);

-- G27 combined | Relationship in Household by Age by Sex
-- Source tables: G27A, G27B
CREATE OR REPLACE VIEW census.xv_2021_g27_relationship_household_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g27a_relationship_household_age_sex_sal AS t1
INNER JOIN census.xv_2021_g27b_relationship_household_age_sex_sal AS t2
    USING (SAL_CODE_2021);

-- G46 combined | Labour Force Status by Age by Sex
-- Source tables: G46A, G46B
CREATE OR REPLACE VIEW census.xv_2021_g46_labour_force_status_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g46a_labour_force_status_age_sex_sal AS t1
INNER JOIN census.xv_2021_g46b_labour_force_status_age_sex_sal AS t2
    USING (SAL_CODE_2021);

-- G47 combined | Labour Force Status by Sex of Parents by Age of Dependent Children for Couple Families
-- Source tables: G47A, G47B, G47C, G47D, G47E, G47F
CREATE OR REPLACE VIEW census.xv_2021_g47_labour_force_status_sex_parents_age_dependent_children_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021),
    t4.* EXCLUDE (SAL_CODE_2021),
    t5.* EXCLUDE (SAL_CODE_2021),
    t6.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g47a_labour_force_status_sex_parents_age_dependent_children_sal AS t1
INNER JOIN census.xv_2021_g47b_labour_force_status_sex_parents_age_dependent_children_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g47c_labour_force_status_sex_parents_age_dependent_children_sal AS t3
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g47d_labour_force_status_sex_parents_age_dependent_children_sal AS t4
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g47e_labour_force_status_sex_parents_age_dependent_children_sal AS t5
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g47f_labour_force_status_sex_parents_age_dependent_children_sal AS t6
    USING (SAL_CODE_2021);

-- G48 combined | Labour Force Status by Sex of Parent by Age of Dependent Children for One Parent Families
-- Source tables: G48A, G48B
CREATE OR REPLACE VIEW census.xv_2021_g48_labour_force_status_sex_parent_age_dependent_children_o_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g48a_labour_force_status_sex_parent_age_dependent_children_o_sal AS t1
INNER JOIN census.xv_2021_g48b_labour_force_status_sex_parent_age_dependent_children_o_sal AS t2
    USING (SAL_CODE_2021);

-- G49 combined | Highest Non-School Qualification:  Level of Education by Age by Sex
-- Source tables: G49A, G49B
CREATE OR REPLACE VIEW census.xv_2021_g49_highest_non_school_qualification_level_education_age_se_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g49a_highest_non_school_qualification_level_education_age_se_sal AS t1
INNER JOIN census.xv_2021_g49b_highest_non_school_qualification_level_education_age_se_sal AS t2
    USING (SAL_CODE_2021);

-- G50 combined | Highest Non-School Qualification: Field of Study by Age by Sex
-- Source tables: G50A, G50B, G50C
CREATE OR REPLACE VIEW census.xv_2021_g50_highest_non_school_qualification_field_study_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g50a_highest_non_school_qualification_field_study_age_sex_sal AS t1
INNER JOIN census.xv_2021_g50b_highest_non_school_qualification_field_study_age_sex_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g50c_highest_non_school_qualification_field_study_age_sex_sal AS t3
    USING (SAL_CODE_2021);

-- G51 combined | Highest Non-School Qualification: Field of Study by Occupation by Sex
-- Source tables: G51A, G51B, G51C
CREATE OR REPLACE VIEW census.xv_2021_g51_highest_non_school_qualification_field_study_occupation_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g51a_highest_non_school_qualification_field_study_occupation_sal AS t1
INNER JOIN census.xv_2021_g51b_highest_non_school_qualification_field_study_occupation_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g51c_highest_non_school_qualification_field_study_occupation_sal AS t3
    USING (SAL_CODE_2021);

-- G52 combined | Highest Non-School Qualification: Level of Education by Occupation by Sex
-- Source tables: G52A, G52B, G52C
CREATE OR REPLACE VIEW census.xv_2021_g52_highest_non_school_qualification_level_education_occupa_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g52a_highest_non_school_qualification_level_education_occupa_sal AS t1
INNER JOIN census.xv_2021_g52b_highest_non_school_qualification_level_education_occupa_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g52c_highest_non_school_qualification_level_education_occupa_sal AS t3
    USING (SAL_CODE_2021);

-- G53 combined | Highest Non-School Qualification: Level of Education by Industry of Employment by Sex
-- Source tables: G53A, G53B, G53C
CREATE OR REPLACE VIEW census.xv_2021_g53_highest_non_school_qualification_level_education_indust_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g53a_highest_non_school_qualification_level_education_indust_sal AS t1
INNER JOIN census.xv_2021_g53b_highest_non_school_qualification_level_education_indust_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g53c_highest_non_school_qualification_level_education_indust_sal AS t3
    USING (SAL_CODE_2021);

-- G54 combined | Industry of Employment by Age by Sex
-- Source tables: G54A, G54B, G54C, G54D
CREATE OR REPLACE VIEW census.xv_2021_g54_industry_employment_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021),
    t4.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g54a_industry_employment_age_sex_sal AS t1
INNER JOIN census.xv_2021_g54b_industry_employment_age_sex_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g54c_industry_employment_age_sex_sal AS t3
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g54d_industry_employment_age_sex_sal AS t4
    USING (SAL_CODE_2021);

-- G55 combined | Industry of Employment by Hours Worked by Sex
-- Source tables: G55A, G55B, G55C, G55D
CREATE OR REPLACE VIEW census.xv_2021_g55_industry_employment_hours_worked_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021),
    t3.* EXCLUDE (SAL_CODE_2021),
    t4.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g55a_industry_employment_hours_worked_sex_sal AS t1
INNER JOIN census.xv_2021_g55b_industry_employment_hours_worked_sex_sal AS t2
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g55c_industry_employment_hours_worked_sex_sal AS t3
    USING (SAL_CODE_2021)
INNER JOIN census.xv_2021_g55d_industry_employment_hours_worked_sex_sal AS t4
    USING (SAL_CODE_2021);

-- G56 combined | Industry of Emplyment by Occupation
-- Source tables: G56A, G56B
CREATE OR REPLACE VIEW census.xv_2021_g56_industry_emplyment_occupation_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g56a_industry_emplyment_occupation_sal AS t1
INNER JOIN census.xv_2021_g56b_industry_emplyment_occupation_sal AS t2
    USING (SAL_CODE_2021);

-- G57 combined | Total Family Income (Weekly) by Labour Force Status of Partners for Couple Families with No Children
-- Source tables: G57A, G57B
CREATE OR REPLACE VIEW census.xv_2021_g57_total_family_income_weekly_labour_force_status_partners_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g57a_total_family_income_weekly_labour_force_status_partners_sal AS t1
INNER JOIN census.xv_2021_g57b_total_family_income_weekly_labour_force_status_partners_sal AS t2
    USING (SAL_CODE_2021);

-- G58 combined | Total Family Income (Weekly) by Labour Force Status of Parents/Partners for Couple Families with Children
-- Source tables: G58A, G58B
CREATE OR REPLACE VIEW census.xv_2021_g58_total_family_income_weekly_labour_force_status_parents_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g58a_total_family_income_weekly_labour_force_status_parents_sal AS t1
INNER JOIN census.xv_2021_g58b_total_family_income_weekly_labour_force_status_parents_sal AS t2
    USING (SAL_CODE_2021);

-- G59 combined | Total Family Income (Weekly) by Labour Force Status of Parent for One Parent Families
-- Source tables: G59A, G59B
CREATE OR REPLACE VIEW census.xv_2021_g59_total_family_income_weekly_labour_force_status_parent_o_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g59a_total_family_income_weekly_labour_force_status_parent_o_sal AS t1
INNER JOIN census.xv_2021_g59b_total_family_income_weekly_labour_force_status_parent_o_sal AS t2
    USING (SAL_CODE_2021);

-- G60 combined | Occupation by age by Sex
-- Source tables: G60A, G60B
CREATE OR REPLACE VIEW census.xv_2021_g60_occupation_age_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g60a_occupation_age_sex_sal AS t1
INNER JOIN census.xv_2021_g60b_occupation_age_sex_sal AS t2
    USING (SAL_CODE_2021);

-- G61 combined | Occupation by Hours Worked by Sex
-- Source tables: G61A, G61B
CREATE OR REPLACE VIEW census.xv_2021_g61_occupation_hours_worked_sex_sal AS
SELECT
    t1.*,
    t2.* EXCLUDE (SAL_CODE_2021)
FROM census.xv_2021_g61a_occupation_hours_worked_sex_sal AS t1
INNER JOIN census.xv_2021_g61b_occupation_hours_worked_sex_sal AS t2
    USING (SAL_CODE_2021);
