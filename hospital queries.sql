USE hospital;

SELECT * FROM Patients;
SELECT * FROM Doctors;
SELECT * FROM Appointments;
SELECT * FROM Treatments;
SELECT * FROM Billing;

-- Find all patients who are males
SELECT * FROM Patients WHERE Gender = 'Male';

-- Find all appointments scheduled for '2024-06-05'
SELECT * FROM Appointments WHERE appointment_date = '2024-06-05';

-- Find all treatments with a treatment cost greater than $200
SELECT * FROM Treatments WHERE treatment_cost > 200.00;

-- Find the total cost of each billing record
SELECT bill_id, (treatment_cost + medicine_cost) AS total_cost FROM Billing;

-- Find the average treatment cost
SELECT AVG(treatment_cost) AS avg_treatment_cost FROM Treatments;

-- Find the total number of appointments for each doctor
SELECT doctor_id, COUNT(*) AS appointment_count FROM Appointments GROUP BY doctor_id;

-- Find the oldest patient
SELECT * FROM Patients ORDER BY Age ASC LIMIT 1;

-- Find the doctor with the most appointments
SELECT doctor_id, COUNT(*) AS appointment_count FROM Appointments GROUP BY doctor_id ORDER BY appointment_count DESC LIMIT 1;

-- Find the total revenue generated from all billing records
SELECT SUM(total_cost) AS total_revenue FROM Billing;

-- Find the appointment with the highest treatment cost
SELECT * FROM Appointments ORDER BY (SELECT SUM(treatment_cost) FROM Treatments WHERE Treatments.appointment_id = Appointments.appointment_id) DESC LIMIT 1;
