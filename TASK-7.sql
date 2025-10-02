use hospital;

#VIEW-1 --> DOCTORS WITH THEIR PATIENTS
CREATE VIEW DoctorPatients AS
SELECT d.Name AS Doctor_Name, p.Name AS Patient_Name, a.AppointmentDate
FROM Doctors d
JOIN appointments a ON d.DoctorID = a.DoctorID
JOIN Patients p ON a.PatientID = p.PatientID;

SELECT * FROM DoctorPatients;

#VIEW-2 --> PATIENT PRESCRIPTION HISTORY
CREATE VIEW PatientPrescriptionHistory AS
SELECT p.Name AS Patient_Name, d.Name AS Dcotor_Name, pr.medicine, pr.dosage, pr.instructions
FROM Prescriptions pr
JOIN Appointments a ON pr.AppointmentID = a.AppointmentID
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID;

SELECT * FROM PatientPrescriptionHistory;

#VIEW-3 --> DOCTOR WISE APPOINTMENTS
CREATE VIEW DoctorWiseAppointments AS
SELECT d.Name AS Doctor_Name, COUNT(a.AppointmentID) AS total_appointments
FROM Doctors d
LEFT JOIN Appointments a ON d.DoctorID = a.DoctorID
GROUP BY d.Name;

SELECT * FROM DoctorWiseAppointments;









