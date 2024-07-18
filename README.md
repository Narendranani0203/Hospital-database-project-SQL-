Hospital Database SQL
Overview
This project contains SQL scripts to create, populate, and manage a hospital database. The database includes various tables to handle information about patients, doctors, appointments, treatments, and more. The aim is to provide a comprehensive and organized way to store and retrieve hospital-related data efficiently.

Database Structure
Tables

Patients:
patient_id (Primary Key)
first_name
last_name
date_of_birth
gender
address
phone_number
email
emergency_contact

Doctors:
doctor_id (Primary Key)
first_name
last_name
specialization
phone_number
email

Appointments:
appointment_id (Primary Key)
patient_id (Foreign Key)
doctor_id (Foreign Key)
appointment_date
appointment_time
status

Treatments:
treatment_id (Primary Key)
appointment_id (Foreign Key)
treatment_description
treatment_date
prescribed_medication

Medications:
medication_id (Primary Key)
medication_name
dosage
side_effects

Staff:
staff_id (Primary Key)
first_name
last_name
position
phone_number
email

Departments:
department_id (Primary Key)
department_name
head_of_department
