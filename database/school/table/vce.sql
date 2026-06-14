CREATE TABLE school.vce(
    school_id INTEGER,
    school_name VARCHAR,
    locality VARCHAR,
    calendar_year INTEGER,
    vce_vm_vet_pgm_u3_4_enrolment INTEGER,
    ib_enrolment_flag VARCHAR,
    student_enrol_vce_u3_4 INTEGER,
    student_enrol_vocational INTEGER,
    median_vce_study_score INTEGER,
    pct_vce_student_apply_tertiary INTEGER,
    pct_satisfactory_vce_comp INTEGER,
    pct_study_score_40_over INTEGER,
    UNIQUE (school_name, locality, calendar_year)
);