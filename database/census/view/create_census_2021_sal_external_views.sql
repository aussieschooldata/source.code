-- Auto-generated DuckDB DDL for ABS 2021 Census GCP SAL CSV external views
-- Source folder: G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS
-- Views generated from uploaded CSV header sample: 119
-- Note: these views reference CSV files in-place; data is not loaded into DuckDB.

CREATE SCHEMA IF NOT EXISTS census;

-- G01 | Selected Person Characteristics by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g01_selected_person_characteristics_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G01_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G02 | Selected Medians and Averages
CREATE OR REPLACE VIEW census.xv_2021_g02_selected_medians_averages_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G02_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G03 | Place of Usual Residence by Place of Enumeration on Census Night by Age
-- Population: Persons (excludes overseas visitors)
CREATE OR REPLACE VIEW census.xv_2021_g03_place_usual_residence_place_enumeration_on_census_night_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G03_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G04A | Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g04a_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G04A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G04B | Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g04b_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G04B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G05 | Registered Marital Status by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g05_registered_marital_status_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G05_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G06 | Social Marital Status by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g06_social_marital_status_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G06_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G07 | Indigenous Status by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g07_indigenous_status_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G07_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G08 | Ancestry by Country of Birth of Parents
-- Population: Responses and persons
CREATE OR REPLACE VIEW census.xv_2021_g08_ancestry_country_birth_parents_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G08_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G09A | Country of Birth of Person by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g09a_country_birth_person_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G09A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G09B | Country of Birth of Person by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g09b_country_birth_person_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G09B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G09C | Country of Birth of Person by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g09c_country_birth_person_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G09C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G09D | Country of Birth of Person by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g09d_country_birth_person_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G09D_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G09E | Country of Birth of Person by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g09e_country_birth_person_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G09E_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G09F | Country of Birth of Person by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g09f_country_birth_person_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G09F_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G09G | Country of Birth of Person by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g09g_country_birth_person_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G09G_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G09H | Country of Birth of Person by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g09h_country_birth_person_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G09H_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G10A | Country of Birth of Person by Year of Arrival in Australia
-- Population: Persons born overseas
CREATE OR REPLACE VIEW census.xv_2021_g10a_country_birth_person_year_arrival_australia_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G10A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G10B | Country of Birth of Person by Year of Arrival in Australia
-- Population: Persons born overseas
CREATE OR REPLACE VIEW census.xv_2021_g10b_country_birth_person_year_arrival_australia_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G10B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G10C | Country of Birth of Person by Year of Arrival in Australia
-- Population: Persons born overseas
CREATE OR REPLACE VIEW census.xv_2021_g10c_country_birth_person_year_arrival_australia_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G10C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G11A | Proficiency in Spoken English by Year of Arrival in Australia by Age
-- Population: Persons born overseas
CREATE OR REPLACE VIEW census.xv_2021_g11a_proficiency_spoken_english_year_arrival_australia_age_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G11A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G11B | Proficiency in Spoken English by Year of Arrival in Australia by Age
-- Population: Persons born overseas
CREATE OR REPLACE VIEW census.xv_2021_g11b_proficiency_spoken_english_year_arrival_australia_age_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G11B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G11C | Proficiency in Spoken English by Year of Arrival in Australia by Age
-- Population: Persons born overseas
CREATE OR REPLACE VIEW census.xv_2021_g11c_proficiency_spoken_english_year_arrival_australia_age_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G11C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G11D | Proficiency in Spoken English by Year of Arrival in Australia by Age
-- Population: Persons born overseas
CREATE OR REPLACE VIEW census.xv_2021_g11d_proficiency_spoken_english_year_arrival_australia_age_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G11D_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G12A | Proficiency in Spoken English of Parents by Age of Dependent Children
-- Population: Dependent children in couple families
CREATE OR REPLACE VIEW census.xv_2021_g12a_proficiency_spoken_english_parents_age_dependent_childr_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G12A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G12B | Proficiency in Spoken English of Parents by Age of Dependent Children
-- Population: Dependent children in couple families
CREATE OR REPLACE VIEW census.xv_2021_g12b_proficiency_spoken_english_parents_age_dependent_childr_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G12B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G13A | Language Used at Home by Proficiency in Spoken English by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g13a_language_used_at_home_proficiency_spoken_english_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G13A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G13B | Language Used at Home by Proficiency in Spoken English by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g13b_language_used_at_home_proficiency_spoken_english_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G13B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G13C | Language Used at Home by Proficiency in Spoken English by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g13c_language_used_at_home_proficiency_spoken_english_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G13C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G13D | Language Used at Home by Proficiency in Spoken English by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g13d_language_used_at_home_proficiency_spoken_english_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G13D_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G13E | Language Used at Home by Proficiency in Spoken English by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g13e_language_used_at_home_proficiency_spoken_english_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G13E_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G14 | Religious Affiliation by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g14_religious_affiliation_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G14_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G15 | Type of Educational Institution Attending (Full-time/Part-Time Student Status by Age) by Sex
-- Population: Persons attending an educational institution
CREATE OR REPLACE VIEW census.xv_2021_g15_type_educational_institution_attending_full_time_part_t_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G15_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G16A | Highest Year of School Completed by Age by Sex
-- Population: Persons aged 15 years and over who are no longer attending primary or secondary school.
CREATE OR REPLACE VIEW census.xv_2021_g16a_highest_year_school_completed_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G16A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G16B | Highest Year of School Completed by Age by Sex
-- Population: Persons aged 15 years and over who are no longer attending primary or secondary school.
CREATE OR REPLACE VIEW census.xv_2021_g16b_highest_year_school_completed_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G16B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G17A | Total Personal Income (Weekly) by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g17a_total_personal_income_weekly_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G17A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G17B | Total Personal Income (Weekly) by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g17b_total_personal_income_weekly_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G17B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G17C | Total Personal Income (Weekly) by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g17c_total_personal_income_weekly_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G17C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G18 | Core Activity Need for Assistance by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g18_core_activity_need_assistance_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G18_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G19A | Type of Long-Term Health Condition by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g19a_type_long_term_health_condition_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G19A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G19B | Type of Long-Term Health Condition by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g19b_type_long_term_health_condition_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G19B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G19C | Type of Long-Term Health Condition by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g19c_type_long_term_health_condition_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G19C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G20A | Count of Selected Long-Term Health Conditions by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g20a_count_selected_long_term_health_conditions_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G20A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G20B | Count of Selected Long-Term Health Conditions by Age by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g20b_count_selected_long_term_health_conditions_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G20B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G21A | Type of Long-Term Health Condition by Selected Person Characteristics
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g21a_type_long_term_health_condition_selected_person_charact_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G21A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G21B | Type of Long-Term Health Condition by Selected Person Characteristics
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g21b_type_long_term_health_condition_selected_person_charact_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G21B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G21C | Type of Long-Term Health Condition by Selected Person Characteristics
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g21c_type_long_term_health_condition_selected_person_charact_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G21C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G22 | Australian Defence Force Service by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g22_australian_defence_force_service_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G22_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G23 | Voluntary Work for an Organisation or Group by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g23_voluntary_work_organisation_or_group_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G23_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G24A | Unpaid Domestic Work:  Number of Hours by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g24a_unpaid_domestic_work_number_hours_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G24A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G24B | Unpaid Domestic Work:  Number of Hours by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g24b_unpaid_domestic_work_number_hours_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G24B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G25 | Unpaid Assistance to a Person with a Disability Health Condition or Due to Old Age by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g25_unpaid_assistance_person_disability_health_condition_or_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G25_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G26A | Unpaid Child Care by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g26a_unpaid_child_care_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G26A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G26B | Unpaid Child Care by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g26b_unpaid_child_care_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G26B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G27A | Relationship in Household by Age by Sex
-- Population: Persons in occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g27a_relationship_household_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G27A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G27B | Relationship in Household by Age by Sex
-- Population: Persons in occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g27b_relationship_household_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G27B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G28 | Number of Children Ever Born
-- Population: Females aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g28_number_children_ever_born_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G28_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G29 | Family Composition
-- Population: Families and persons in families in occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g29_family_composition_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G29_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G30 | Family Composition and Country of Birth of Parents by Age of Dependent Children
-- Population: Dependent children
CREATE OR REPLACE VIEW census.xv_2021_g30_family_composition_country_birth_parents_age_dependent_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G30_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G31 | Family Blending
-- Population: Couple families with children
CREATE OR REPLACE VIEW census.xv_2021_g31_family_blending_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G31_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G32 | Total Family Income (Weekly) by Family Composition
-- Population: Families in family households
CREATE OR REPLACE VIEW census.xv_2021_g32_total_family_income_weekly_family_composition_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G32_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G33 | Total Household Income (Weekly) by Household Composition
-- Population: Occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g33_total_household_income_weekly_household_composition_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G33_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G34 | Number of Motor Vehicles by Dwellings
-- Population: Occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g34_number_motor_vehicles_dwellings_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G34_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G35 | Household Composition by Number of Persons Usually Resident
-- Population: Occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g35_household_composition_number_persons_usually_resident_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G35_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G36 | Dwelling Structure
-- Population: Private dwellings and persons in occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g36_dwelling_structure_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G36_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G37 | Tenure and Landlord Type by Dwelling Structure
-- Population: Occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g37_tenure_landlord_type_dwelling_structure_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G37_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G38 | Mortgage Repayment (Monthly) by Dwelling Structure
-- Population: Occupied private dwellings being purchased
CREATE OR REPLACE VIEW census.xv_2021_g38_mortgage_repayment_monthly_dwelling_structure_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G38_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G39 | Mortgage Repayment (Monthly) by Family Composition
-- Population: Families in occupied private dwellings being purchased
CREATE OR REPLACE VIEW census.xv_2021_g39_mortgage_repayment_monthly_family_composition_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G39_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G40 | Rent (Weekly) by Landlord Type
-- Population: Occupied private dwellings being rented
CREATE OR REPLACE VIEW census.xv_2021_g40_rent_weekly_landlord_type_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G40_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G41 | Dwelling Structure by Number of Bedrooms
-- Population: Occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g41_dwelling_structure_number_bedrooms_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G41_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G42 | Dwelling Structure by Household Composition and Family Composition
-- Population: Occupied private dwellings
CREATE OR REPLACE VIEW census.xv_2021_g42_dwelling_structure_household_composition_family_composi_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G42_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G43 | Selected Labour Force Education and Migration Characteristics by Sex
-- Population: Persons
CREATE OR REPLACE VIEW census.xv_2021_g43_selected_labour_force_education_migration_characteristi_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G43_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G44 | Place of Usual Residence 1 Year Ago by Sex
-- Population: Persons aged 1 year and over
CREATE OR REPLACE VIEW census.xv_2021_g44_place_usual_residence_1_year_ago_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G44_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G45 | Place of Usual Residence 5 Years Ago by Sex
-- Population: Persons aged 5 years and over
CREATE OR REPLACE VIEW census.xv_2021_g45_place_usual_residence_5_years_ago_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G45_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G46A | Labour Force Status by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g46a_labour_force_status_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G46A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G46B | Labour Force Status by Age by Sex
-- Population: Persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g46b_labour_force_status_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G46B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G47A | Labour Force Status by Sex of Parents by Age of Dependent Children for Couple Families
-- Population: Dependent children in couple families
CREATE OR REPLACE VIEW census.xv_2021_g47a_labour_force_status_sex_parents_age_dependent_children_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G47A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G47B | Labour Force Status by Sex of Parents by Age of Dependent Children for Couple Families
-- Population: Dependent children in couple families
CREATE OR REPLACE VIEW census.xv_2021_g47b_labour_force_status_sex_parents_age_dependent_children_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G47B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G47C | Labour Force Status by Sex of Parents by Age of Dependent Children for Couple Families
-- Population: Dependent children in couple families
CREATE OR REPLACE VIEW census.xv_2021_g47c_labour_force_status_sex_parents_age_dependent_children_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G47C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G47D | Labour Force Status by Sex of Parents by Age of Dependent Children for Couple Families
-- Population: Dependent children in couple families
CREATE OR REPLACE VIEW census.xv_2021_g47d_labour_force_status_sex_parents_age_dependent_children_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G47D_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G47E | Labour Force Status by Sex of Parents by Age of Dependent Children for Couple Families
-- Population: Dependent children in couple families
CREATE OR REPLACE VIEW census.xv_2021_g47e_labour_force_status_sex_parents_age_dependent_children_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G47E_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G47F | Labour Force Status by Sex of Parents by Age of Dependent Children for Couple Families
-- Population: Dependent children in couple families
CREATE OR REPLACE VIEW census.xv_2021_g47f_labour_force_status_sex_parents_age_dependent_children_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G47F_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G48A | Labour Force Status by Sex of Parent by Age of Dependent Children for One Parent Families
-- Population: Dependent children in one parent families
CREATE OR REPLACE VIEW census.xv_2021_g48a_labour_force_status_sex_parent_age_dependent_children_o_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G48A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G48B | Labour Force Status by Sex of Parent by Age of Dependent Children for One Parent Families
-- Population: Dependent children in one parent families
CREATE OR REPLACE VIEW census.xv_2021_g48b_labour_force_status_sex_parent_age_dependent_children_o_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G48B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G49A | Highest Non-School Qualification:  Level of Education by Age by Sex
-- Population: Persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g49a_highest_non_school_qualification_level_education_age_se_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G49A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G49B | Highest Non-School Qualification:  Level of Education by Age by Sex
-- Population: Persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g49b_highest_non_school_qualification_level_education_age_se_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G49B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G50A | Highest Non-School Qualification: Field of Study by Age by Sex
-- Population: Persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g50a_highest_non_school_qualification_field_study_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G50A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G50B | Highest Non-School Qualification: Field of Study by Age by Sex
-- Population: Persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g50b_highest_non_school_qualification_field_study_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G50B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G50C | Highest Non-School Qualification: Field of Study by Age by Sex
-- Population: Persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g50c_highest_non_school_qualification_field_study_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G50C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G51A | Highest Non-School Qualification: Field of Study by Occupation by Sex
-- Population: Employed persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g51a_highest_non_school_qualification_field_study_occupation_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G51A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G51B | Highest Non-School Qualification: Field of Study by Occupation by Sex
-- Population: Employed persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g51b_highest_non_school_qualification_field_study_occupation_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G51B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G51C | Highest Non-School Qualification: Field of Study by Occupation by Sex
-- Population: Employed persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g51c_highest_non_school_qualification_field_study_occupation_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G51C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G52A | Highest Non-School Qualification: Level of Education by Occupation by Sex
-- Population: Employed persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g52a_highest_non_school_qualification_level_education_occupa_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G52A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G52B | Highest Non-School Qualification: Level of Education by Occupation by Sex
-- Population: Employed persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g52b_highest_non_school_qualification_level_education_occupa_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G52B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G52C | Highest Non-School Qualification: Level of Education by Occupation by Sex
-- Population: Employed persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g52c_highest_non_school_qualification_level_education_occupa_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G52C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G53A | Highest Non-School Qualification: Level of Education by Industry of Employment by Sex
-- Population: Employed persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g53a_highest_non_school_qualification_level_education_indust_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G53A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G53B | Highest Non-School Qualification: Level of Education by Industry of Employment by Sex
-- Population: Employed persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g53b_highest_non_school_qualification_level_education_indust_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G53B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G53C | Highest Non-School Qualification: Level of Education by Industry of Employment by Sex
-- Population: Employed persons aged 15 years and over with a non-school qualification
CREATE OR REPLACE VIEW census.xv_2021_g53c_highest_non_school_qualification_level_education_indust_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G53C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G54A | Industry of Employment by Age by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g54a_industry_employment_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G54A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G54B | Industry of Employment by Age by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g54b_industry_employment_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G54B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G54C | Industry of Employment by Age by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g54c_industry_employment_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G54C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G54D | Industry of Employment by Age by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g54d_industry_employment_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G54D_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G55A | Industry of Employment by Hours Worked by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g55a_industry_employment_hours_worked_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G55A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G55B | Industry of Employment by Hours Worked by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g55b_industry_employment_hours_worked_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G55B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G55C | Industry of Employment by Hours Worked by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g55c_industry_employment_hours_worked_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G55C_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G55D | Industry of Employment by Hours Worked by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g55d_industry_employment_hours_worked_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G55D_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G56A | Industry of Emplyment by Occupation
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g56a_industry_emplyment_occupation_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G56A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G56B | Industry of Emplyment by Occupation
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g56b_industry_emplyment_occupation_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G56B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G57A | Total Family Income (Weekly) by Labour Force Status of Partners for Couple Families with No Children
-- Population: Couple families with no children
CREATE OR REPLACE VIEW census.xv_2021_g57a_total_family_income_weekly_labour_force_status_partners_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G57A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G57B | Total Family Income (Weekly) by Labour Force Status of Partners for Couple Families with No Children
-- Population: Couple families with no children
CREATE OR REPLACE VIEW census.xv_2021_g57b_total_family_income_weekly_labour_force_status_partners_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G57B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G58A | Total Family Income (Weekly) by Labour Force Status of Parents/Partners for Couple Families with Children
-- Population: Couple families with no children
CREATE OR REPLACE VIEW census.xv_2021_g58a_total_family_income_weekly_labour_force_status_parents_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G58A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G58B | Total Family Income (Weekly) by Labour Force Status of Parents/Partners for Couple Families with Children
-- Population: Couple families with no children
CREATE OR REPLACE VIEW census.xv_2021_g58b_total_family_income_weekly_labour_force_status_parents_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G58B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G59A | Total Family Income (Weekly) by Labour Force Status of Parent for One Parent Families
-- Population: One parent families
CREATE OR REPLACE VIEW census.xv_2021_g59a_total_family_income_weekly_labour_force_status_parent_o_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G59A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G59B | Total Family Income (Weekly) by Labour Force Status of Parent for One Parent Families
-- Population: One parent families
CREATE OR REPLACE VIEW census.xv_2021_g59b_total_family_income_weekly_labour_force_status_parent_o_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G59B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G60A | Occupation by age by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g60a_occupation_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G60A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G60B | Occupation by age by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g60b_occupation_age_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G60B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G61A | Occupation by Hours Worked by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g61a_occupation_hours_worked_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G61A_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G61B | Occupation by Hours Worked by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g61b_occupation_hours_worked_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G61B_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);

-- G62 | Method of Travel to Work by Sex
-- Population: Employed persons aged 15 years and over
CREATE OR REPLACE VIEW census.xv_2021_g62_method_travel_work_sex_sal AS
SELECT *
FROM read_csv(
    'G:\My Drive\AussieSchoolDataV2\Source Data\Census\2021\2021 Census GCP Suburbs and Localities for AUS\2021Census_G62_AUST_SAL.csv',
    header = true,
    auto_detect = true,
    normalize_names = false
);
