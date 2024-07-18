CREATE DATABASE Hospital;
USE Hospital;

CREATE TABLE Patients (
    Patient_id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Phone_number VARCHAR(10),
    Address VARCHAR(20) -- Added Address column
);

INSERT INTO Patients (Patient_id, First_name, Last_name, Age, Gender, Phone_number)
VALUES 
    (1, 'Suresh', 'Reddy', 30, 'Male', '9876543210'),
    (2, 'Lakshmi', 'Naidu', 25, 'Female', '9876543211'),
    (3, 'Ravi', 'Kumar', 40, 'Male', '9876543212'),
    (4, 'Anjali', 'Gupta', 35, 'Female', '9876543213'),
    (5, 'Prasad', 'Sharma', 28, 'Male', '9876543214'),
    (6, 'Divya', 'Rao', 32, 'Female', '9876543215'),
    (7, 'Ramesh', 'Patel', 45, 'Male', '9876543216'),
    (8, 'Anitha', 'Khan', 27, 'Female', '9876543217'),
    (9, 'Venkat', 'Reddy', 33, 'Male', '9876543218'),
    (10, 'Padma', 'Nair', 50, 'Female', '9876543219'),
    (11, 'Kiran', 'Babu', 36, 'Male', '9876543220'),
    (12, 'Swathi', 'Sinha', 29, 'Female', '9336543221');

CREATE TABLE Doctors (
    Doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Specialization VARCHAR(50),
    Phone_number VARCHAR(15),
    Email VARCHAR(50)
);

INSERT INTO Doctors (First_name, Last_name, Specialization, Phone_number, Email)
VALUES 
    ('Ramesh', 'Reddy', 'Cardiology', '987-654-3210', 'ramesh.reddy@example.com'),
    ('Saritha', 'Naidu', 'Neurology', '987-654-3211', 'saritha.naidu@example.com'),
    ('Prakash', 'Kumar', 'Orthopedics', '987-654-3212', 'prakash.kumar@example.com'),
    ('Indira', 'Rao', 'Oncology', '987-654-3213', 'indira.rao@example.com'),
    ('Sai', 'Krishna', 'Pediatrics', '987-654-3214', 'sai.krishna@example.com');

CREATE TABLE Appointments (
    Appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    Patient_id INT,
    Doctor_id INT,
    Appointment_date DATE,
    Appointment_time TIME,
    Reason VARCHAR(255),
    FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
    FOREIGN KEY (Doctor_id) REFERENCES Doctors(Doctor_id)
);


INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, reason)
VALUES 
    (1, 1, '2024-06-01', '10:00:00', 'Heart Checkup'),
    (2, 2, '2024-06-02', '11:00:00', 'Headache'),
    (3, 3, '2024-06-03', '12:00:00', 'Bone Fracture'),
    (4, 4, '2024-06-04', '13:00:00', 'Cancer Screening'),
    (5, 5, '2024-06-05', '14:00:00', 'Child Vaccination'),
    (6, 1, '2024-06-06', '09:00:00', 'General Checkup'),
    (7, 2, '2024-06-07', '10:00:00', 'Migraine'),
    (8, 3, '2024-06-08', '11:00:00', 'ACL Injury'),
    (9, 4, '2024-06-09', '12:00:00', 'Chemotherapy'),
    (10, 5, '2024-06-10', '13:00:00', 'Routine Vaccination'),
    (11, 1, '2024-06-11', '09:00:00', 'Annual Physical'),
    (12, 2, '2024-06-12', '10:00:00', 'Allergy Consultation');


CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    treatment_description TEXT,
    prescribed_medicine VARCHAR(255),
    treatment_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
INSERT INTO Treatments (appointment_id, treatment_description, prescribed_medicine, treatment_date)
VALUES 
    (1, 'Routine checkup. No significant issues found.', NULL, '2024-06-01'),
    (2, 'Prescribed pain relievers. Adviced rest.', 'Paracetamol', '2024-06-02'),
    (3, 'X-ray taken. No fractures found. Advised to use pain relievers.', 'Ibuprofen', '2024-06-03'),
    (4, 'Underwent chemotherapy session.', 'Chemotherapy drugs', '2024-06-04'),
    (5, 'Routine vaccination administered.', 'Vaccine', '2024-06-05'),
    (6, 'Blood pressure check. Advised lifestyle changes.', NULL, '2024-06-06'),
    (7, 'Migraine symptoms assessed. Prescribed migraine medication.', 'Sumatriptan', '2024-06-07'),
    (8, 'ACL injury diagnosed. Referred to orthopedic surgeon for further evaluation.', NULL, '2024-06-08'),
    (9, 'First round of chemotherapy administered.', 'Chemotherapy drugs', '2024-06-09'),
    (10, 'Routine vaccination administered.', 'Vaccine', '2024-06-10'),
    (11, 'Annual physical examination conducted. No issues found.', NULL, '2024-06-11'),
    (12, 'Allergy symptoms assessed. Prescribed antihistamines.', 'Cetirizine', '2024-06-12');
    
    CREATE TABLE Billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    appointment_id INT,
    treatment_cost DECIMAL(10, 2),
    medicine_cost DECIMAL(10, 2),
    total_cost DECIMAL(10, 2),
    billing_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

INSERT INTO Billing (patient_id, appointment_id, treatment_cost, medicine_cost, total_cost, billing_date)
VALUES 
    (1, 1, 250.00, 150.00, 400.00, '2024-06-01'),
    (2, 2, 200.00, 100.00, 300.00, '2024-06-02'),
    (3, 3, 180.00, 150.00, 330.00, '2024-06-03'),
    (4, 4, 300.00, 200.00, 500.00, '2024-06-04'),
    (5, 5, 120.00, 100.00, 220.00, '2024-06-05'),
    (6, 6, 200.00, 100.00, 300.00, '2024-06-06'),
    (7, 7, 240.00, 150.00, 390.00, '2024-06-07'),
    (8, 8, 100.00, 50.00, 150.00, '2024-06-08'),
    (9, 9, 400.00, 100.00, 500.00, '2024-06-09'),
    (10, 10, 150.00, 100.00, 250.00, '2024-06-10'),
    (11, 11, 120.00, 100.00, 220.00, '2024-06-11'),
    (12, 12, 300.00, 200.00, 500.00, '2024-06-12');
    
SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Treatments;
SELECT * FROM Billing;

drop table patient;
drop table DOCTORs;
drop table Appointments;
drop table Treatments;