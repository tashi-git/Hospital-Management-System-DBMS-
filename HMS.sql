CREATE TYPE gender_enum AS ENUM('Male', 'Female', 'Other');

CREATE TABLE patient(
	patient_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	dob DATE,
	gender gender_enum,
	address VARCHAR(255),
	phone VARCHAR(15) UNIQUE
	
);

INSERT INTO patient (name, dob, gender, address, phone) VALUES
('Tashi Wangchuk', '1985-04-12', 'Male', 'Thimphu, Bhutan', '17100001'),
('Pema Choden', '1990-06-25', 'Female', 'Paro, Bhutan', '17100002'),
('Kezang Dorji', '1978-12-03', 'Male', 'Phuentsholing, Bhutan', '17100003'),
('Sonam Wangmo', '1988-09-15', 'Female', 'Thimphu, Bhutan', '17100004'),
('Sangay Tshering', '2000-01-20', 'Male', 'Trongsa, Bhutan', '17100005'),
('Chimi Dorji', '1995-05-10', 'Female', 'Wangdue, Bhutan', '17100006'),
('Dorji Wangchuk', '1982-03-22', 'Male', 'Bumthang, Bhutan', '17100007'),
('Dechen Wangmo', '1998-11-11', 'Female', 'Mongar, Bhutan', '17100008'),
('Kinley Dorji', '1975-07-30', 'Male', 'Gelegphu, Bhutan', '17100009'),
('Tshering Pem', '1992-08-05', 'Female', 'Trashigang, Bhutan', '17100010'),
('Tandin Wangchuk', '1987-02-14', 'Male', 'Paro, Bhutan', '17100011'),
('Sangay Choden', '2001-12-01', 'Female', 'Thimphu, Bhutan', '17100012'),
('Jigme Dorji', '1993-06-17', 'Male', 'Haa, Bhutan', '17100013'),
('Kezang Wangmo', '1989-04-29', 'Female', 'Lhuntse, Bhutan', '17100014'),
('Phuntsho Tshering', '1980-10-10', 'Male', 'Samdrup Jongkhar, Bhutan', '17100015');

SELECT * FROM patient;

CREATE TABLE doctor(
	doctor_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	speciality VARCHAR(50),
	phone VARCHAR(15) UNIQUE
);

INSERT INTO doctor (name, speciality, phone) VALUES
('Dr. Karma Wangchuk', 'Cardiology', '17220001'),
('Dr. Pema Choden', 'Dermatology', '17220002'),
('Dr. Tashi Dorji', 'Neurology', '17220003'),
('Dr. Sonam Wangmo', 'Pediatrics', '17220004'),
('Dr. Sangay Tshering', 'Orthopedics', '17220005'),
('Dr. Chimi Dorji', 'General Medicine', '17220006'),
('Dr. Dorji Wangchuk', 'ENT', '17220007'),
('Dr. Dechen Wangmo', 'Gynecology', '17220008'),
('Dr. Kinley Dorji', 'Ophthalmology', '17220009'),
('Dr. Tshering Pem', 'Cardiology', '17220010'),
('Dr. Tandin Wangchuk', 'Neurology', '17220011'),
('Dr. Sangay Choden', 'Dermatology', '17220012'),
('Dr. Jigme Dorji', 'Orthopedics', '17220013'),
('Dr. Kezang Wangmo', 'Pediatrics', '17220014'),
('Dr. Phuntsho Tshering', 'General Medicine', '17220015');

SELECT * FROM doctor;



CREATE TYPE status_enum AS ENUM('Scheduled', 'Completed', 'Cancelled')

CREATE TABLE appointment(
	appointment_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	patient_id INT REFERENCES patient(patient_id) ON DELETE CASCADE,
	doctor_id INT REFERENCES doctor(doctor_id) ON DELETE SET NULL,
	appointment_date DATE NOT NULL,
	appointment_time TIME NOT NULL,
	status status_enum,
	status status_enum DEFAULT 'Scheduled'
);

INSERT INTO appointment (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(1, 1, '2025-08-21', '09:00:00', 'Completed'),
(2, 2, '2025-08-22', '10:45:00', 'Scheduled'),
(3, 3, '2025-08-23', '11:05:00', 'Completed'),
(4, 4, '2025-08-24', '14:30:00', 'Scheduled'),
(5, 5, '2025-08-26', '15:20:00', 'Cancelled'),
(6, 6, '2025-08-27', '09:15:00', 'Scheduled'),
(7, 7, '2025-08-28', '10:10:00', 'Completed'),
(8, 8, '2025-08-29', '11:50:00', 'Scheduled'),
(9, 9, '2025-08-30', '13:05:00', 'Scheduled'),
(10, 10, '2025-09-01', '14:45:00', 'Completed'),
(11, 11, '2025-09-02', '09:20:00', 'Scheduled'),
(12, 12, '2025-09-03', '10:35:00', 'Completed'),
(13, 13, '2025-09-05', '11:00:00', 'Scheduled'),
(14, 14, '2025-09-06', '13:55:00', 'Scheduled'),
(15, 15, '2025-09-07', '15:05:00', 'Scheduled');

SELECT * FROM appointment;


CREATE TABLE medical_record(
	record_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	patient_id INT REFERENCES patient(patient_id) ON DELETE CASCADE,
	doctor_id INT REFERENCES doctor(doctor_id) ON DELETE SET NULL,
	diagnosis TEXT,
	treatment TEXT,
	record_date DATE NOT NULL
);

INSERT INTO medical_record (patient_id, doctor_id, diagnosis, treatment, record_date) VALUES
(1, 1, 'Hypertension', 'Amlodipine 5mg daily', '2025-08-21'),
(2, 2, 'Acne', 'Topical cream twice daily', '2025-08-22'),
(3, 3, 'Migraine', 'Painkillers as needed', '2025-08-23'),
(4, 4, 'Common Cold', 'Rest and fluids', '2025-08-24'),
(5, 5, 'Fracture', 'Cast for 6 weeks', '2025-08-25'),
(6, 6, 'Flu', 'Antiviral medication', '2025-08-26'),
(7, 7, 'Ear Infection', 'Antibiotics', '2025-08-27'),
(8, 8, 'Pregnancy Checkup', 'Routine checkup', '2025-08-28'),
(9, 9, 'Cataract', 'Surgery scheduled', '2025-08-29'),
(10, 10, 'Hypertension', 'Medication adjustment', '2025-08-30'),
(11, 11, 'Migraine', 'Lifestyle changes', '2025-09-01'),
(12, 12, 'Skin Rash', 'Topical ointment', '2025-09-02'),
(13, 13, 'Bone Fracture', 'Physiotherapy after cast', '2025-09-03'),
(14, 14, 'Routine Checkup', 'General health advice', '2025-09-04'),
(15, 15, 'Diabetes', 'Insulin therapy', '2025-09-05');

SELECT * FROM medical_record;


-- Question 1
SELECT p.patient_id, p.name, COUNT(a.appointment_id) AS total_appointments
FROM patient p
JOIN appointment a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.name
HAVING COUNT(a.appointment_id) > (
    SELECT AVG(appointment_count) 
    FROM (
        SELECT COUNT(*) AS appointment_count
        FROM appointment
        GROUP BY patient_id
    ) AS sub
);


-- Question 2
SELECT *
FROM patient
WHERE phone IS NOT NULL;


-- Question 3
INSERT INTO appointment (doctor_id, patient_id, appointment_date, appointment_time, status)
SELECT 1, patient_id, '2025-08-27', '10:00:00', 'Scheduled'
FROM patient
WHERE patient_id = 1  
AND NOT EXISTS (
    SELECT 1
    FROM appointment
    WHERE doctor_id = 1
      AND appointment_date = '2025-08-27'
      AND appointment_time = '10:00:00'
      AND status = 'Scheduled'
);

select * from appointment;

-- Question 4
SELECT phone
FROM patient
WHERE phone IS NOT NULL

UNION

SELECT phone
FROM doctor
WHERE phone IS NOT NULL;

select * from medical_record;

-- Question 5
ALTER TABLE medical_record
ADD COLUMN required_specialty VARCHAR(50);

UPDATE medical_record
SET required_specialty = CASE record_id
    WHEN 1 THEN 'Cardiology'
    WHEN 2 THEN 'Dermatology'
    WHEN 3 THEN 'Neurology'
    WHEN 4 THEN 'General Medicine'
    WHEN 5 THEN 'Orthopedics'
    WHEN 6 THEN 'General Medicine'
    WHEN 7 THEN 'ENT'
    WHEN 8 THEN 'Gynecology'
    WHEN 9 THEN 'Ophthalmology'
    WHEN 10 THEN 'Cardiology'
    WHEN 11 THEN 'Neurology'
    WHEN 12 THEN 'Dermatology'
    WHEN 13 THEN 'Orthopedics'
    WHEN 14 THEN 'General Medicine'
    WHEN 15 THEN 'Endocrinology'
END;

select * from doctor;

SELECT speciality
FROM doctor

INTERSECT

SELECT required_specialty
FROM medical_record;

-- Question 6
SELECT patient_id, name
FROM patient

EXCEPT

SELECT p.patient_id, p.name
FROM patient p
JOIN medical_record m ON p.patient_id = m.patient_id;

-- Question 7
SELECT 
    a.appointment_id,
    p.name AS patient_name,
    d.name AS doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM appointment a
INNER JOIN patient p ON a.patient_id = p.patient_id
INNER JOIN doctor d ON a.doctor_id = d.doctor_id;



-- Question 8
SELECT 
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM patient p
LEFT OUTER JOIN appointment a 
    ON p.patient_id = a.patient_id
ORDER BY p.patient_id;


-- Question 9
SELECT 
    a1.doctor_id,
    a1.appointment_date,
    a1.appointment_time AS time1,
    a2.appointment_time AS time2
FROM appointment a1
JOIN appointment a2 
    ON a1.doctor_id = a2.doctor_id
   AND a1.appointment_date = a2.appointment_date
   AND a1.appointment_id < a2.appointment_id;

-- Question 10
SELECT 
    p.patient_id,
    p.name AS patient_name,
    m.record_id,
    m.diagnosis,
    m.treatment,
    m.record_date
FROM patient p
FULL JOIN medical_record m 
    ON p.patient_id = m.patient_id
ORDER BY p.patient_id;

-- If a patient has no medical record → the record_id, diagnosis, etc. will be NULL.
-- If a medical record doesn’t match any patient → the patient_id, patient_name, etc. will be NULL.


-- Question 11
CREATE OR REPLACE FUNCTION limit_doctor_appointments()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) 
        FROM appointment
        WHERE doctor_id = NEW.doctor_id
          AND appointment_date = NEW.appointment_date) >= 10 THEN
        RAISE EXCEPTION 'Doctor % already has 10 appointments on %', 
                        NEW.doctor_id, NEW.appointment_date;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER limit_appointments_trigger
BEFORE INSERT ON appointment
FOR EACH ROW
EXECUTE FUNCTION limit_doctor_appointments();

-- Question 12
CREATE OR REPLACE FUNCTION complete_appointment()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE appointment
    SET status = 'Completed'
    WHERE appointment_id = NEW.appointment_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS set_appointment_completed ON medical_record;

CREATE TRIGGER set_appointment_completed
AFTER INSERT ON medical_record
FOR EACH ROW
EXECUTE FUNCTION complete_appointment();

ALTER TABLE medical_record
ADD COLUMN appointment_id INT REFERENCES appointment(appointment_id) ON DELETE CASCADE;


INSERT INTO medical_record (patient_id, doctor_id, appointment_id, diagnosis, treatment, record_date)
VALUES (2, 2, 2, 'Hypertension Follow-up', 'Medication review', '2025-08-22');

SELECT appointment_id, status 
FROM appointment
WHERE appointment_id = 2;

-- Question 13
CREATE VIEW PatientAppointments AS
SELECT 
    p.patient_id,
    p.name AS patient_name,
    a.appointment_id,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM patient p
JOIN appointment a 
    ON p.patient_id = a.patient_id
ORDER BY p.patient_id, a.appointment_date, a.appointment_time;

select * from PatientAppointments;

-- Question 14
UPDATE PatientAppointments
SET status = 'Cancelled'
WHERE appointment_id = 1;

UPDATE appointment
SET status = 'Cancelled'
WHERE appointment_id = 1;

select * from PatientAppointments;



