DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE hospitals
(
    hospital_id SERIAL PRIMARY KEY,
    hospital_name TEXT NOT NULL
);

CREATE TABLE patients
(
    patient_id SERIAL PRIMARY KEY,
    patient_name TEXT NOT NULL,
    birthdate DATE NOT NULL
);

CREATE TABLE diseases
(
    disease_id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL,
    disease_desc TEXT
);

CREATE TABLE doctors
(
    doctor_id SERIAL PRIMARY KEY,
    doctor_name TEXT NOT NULL,
    hospital_id INTEGER REFERENCES hospitals ON DELETE SET NULL
);


CREATE TABLE visits
(
    visit_id SERIAL PRIMARY KEY,
    visit_date DATE NOT NULL,
    patient_id INTEGER REFERENCES patients,
    doctor_id INTEGER REFERENCES doctors
);

CREATE TABLE diagnoses
(
    diagnosis_id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits,
    disease_id INTEGER REFERENCES diseases
);

INSERT INTO hospitals
    (hospital_name)
VALUES 
    ('Springboard Healthcare Center');

INSERT INTO patients
    (patient_name, birthdate)
VALUES
    ('Andy', '1990-03-03');

INSERT INTO diseases
    (disease_name, disease_desc)
VALUES
    ('SQLitis', 'If you have this disease you die right away.');

INSERT INTO doctors
    (doctor_name, hospital_id)
VALUES
    ('Doctor Man', 1);

INSERT INTO visits
    (visit_date, patient_id, doctor_id)
VALUES
    ('2023-03-14', 1, 1);

INSERT INTO diagnoses
    (visit_id, disease_id)
VALUES
    (1,1);