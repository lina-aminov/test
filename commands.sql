CREATE TABLE IF NOT EXISTS MedicalRecords(
    MedicalRecordsID INTEGER PRIMARY KEY AUTOINCREMENT,
    Patient_ID INTEGER references patients,
    Allergies VarChar(25),
    Previous_Condition VarChar(30),
    Previous_Medication VarChar(30),
    Vaccines VarChar (30),
    Previous_Appointments VarChar(50)
);

CREATE TABLE IF NOT EXISTS GP (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    appointment_id INT NOT NULL,
    Allergies VARCHAR(25),
    PreviousCondition VARCHAR(30),
    PreviousMedication VARCHAR(30),
    GP_name VARCHAR(100) NOT NULL,
    GP_address VARCHAR(120) NOT NULL,
    FOREIGN KEY (appointment_id) REFERENCES Appointment (appointment_id)
    FOREIGN KEY (Allergies) REFERENCES MedicalRecords (Allergies)
    FOREIGN KEY (PreviousCondition) REFERENCES MedicalRecords (PreviousCondition)
    FOREIGN KEY (PreviousMedication) REFERENCES MedicalRecords (PreviousMedication)
);

CREATE TABLE  IF NOT EXISTS Appointment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    gp_id INTEGER REFERENCES gp NOT NULL,
    patient_id INTEGER REFERENCES patients NOT NULL,
    appointment_date_time DATETIME,
    room INTEGER NOT NULL,
    start_time TIME,
    end_time TIME
);

CREATE TABLE IF NOT EXISTS patients (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Patient_id NOT NULL,
    First_Name TEXT NOT NULL,
    Last_Name TEXT NOT NULL,
    DOB NUM NOT NULL,
    Address TEXT NOT NULL,
    Contact_number  NOT NULL,
    Appointment_id NOT NULL
);


--INSERT INTO Appointment VALUES (NULL, NULL, NULL, '2022-08-13', '03', '8:30:00', '8:50:00');
INSERT INTO patients (id, patient_id, first_name, last_name, DOB, address, contact_number, appointment_id)
VALUES ('1', '1', 'Francesca', 'Akhtar', '03-05-1954', '50 Stroude Road, Silfield, NR18 4YS', '07748051499', '1');
