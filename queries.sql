CREATE TABLE CUSTOMER (
    Customer_ID INT PRIMARY KEY,
    FName VARCHAR2(50) NOT NULL,
    LName VARCHAR2(50) NOT NULL
)

CREATE TABLE CUSTOMER_PHONE (
    Customer_ID INT,
    Phone VARCHAR2(20),
    PRIMARY KEY (Customer_ID, Phone),
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
)

CREATE TABLE VEHICLE (
    VIN VARCHAR2(50) PRIMARY KEY,
    Brand VARCHAR2(50) NOT NULL,
    Model VARCHAR2(50) NOT NULL,
    Customer_ID INT,
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
)

CREATE TABLE PART (
    Part_ID INT PRIMARY KEY,
    Price DECIMAL(10, 2),
    Name VARCHAR2(100) NOT NULL
)

CREATE TABLE Warranty (
    Warranty_ID INT PRIMARY KEY,
    Start_Date DATE,
    End_Date DATE,
    Part_ID INT,
    FOREIGN KEY (Part_ID) REFERENCES PART(Part_ID)
)

CREATE TABLE Modification_Job (
    Job_ID INT PRIMARY KEY,
    Job_Date DATE NOT NULL,
    VIN VARCHAR2(50),
    FOREIGN KEY (VIN) REFERENCES VEHICLE(VIN)
)

CREATE TABLE Dyno_Test (
    Test_ID INT,
    Job_ID INT,
    Horsepower INT,
    Torque INT,
    PRIMARY KEY (Test_ID, Job_ID),
    FOREIGN KEY (Job_ID) REFERENCES Modification_Job(Job_ID)
)

CREATE TABLE USES (
    Job_ID INT,
    Part_ID INT,
    Quantity INT,
    PRIMARY KEY (Job_ID, Part_ID),
    FOREIGN KEY (Job_ID) REFERENCES Modification_Job(Job_ID),
    FOREIGN KEY (Part_ID) REFERENCES PART(Part_ID)
)








INSERT INTO CUSTOMER (Customer_ID, FName, LName) VALUES (1, 'Ahmed', 'Hassan');
INSERT INTO CUSTOMER (Customer_ID, FName, LName) VALUES (2, 'Omar', 'Tariq');

INSERT INTO CUSTOMER_PHONE (Customer_ID, Phone) VALUES (1, '01000000001');
INSERT INTO CUSTOMER_PHONE (Customer_ID, Phone) VALUES (1, '01111111111');
INSERT INTO CUSTOMER_PHONE (Customer_ID, Phone) VALUES (2, '01222222222');

INSERT INTO VEHICLE (VIN, Brand, Model, Customer_ID) VALUES ('V12345', 'BMW', 'M3', 1);
INSERT INTO VEHICLE (VIN, Brand, Model, Customer_ID) VALUES ('V67890', 'Nissan', 'GTR', 2);

INSERT INTO PART (Part_ID, Price, Name) VALUES (101, 15000.00, 'Turbo Charger');
INSERT INTO PART (Part_ID, Price, Name) VALUES (102, 5000.00, 'Exhaust System');

INSERT INTO Warranty (Warranty_ID, Start_Date, End_Date, Part_ID) 
VALUES (1001, TO_DATE('2026-05-01', 'YYYY-MM-DD'), TO_DATE('2027-05-01', 'YYYY-MM-DD'), 101);

INSERT INTO Modification_Job (Job_ID, Job_Date, VIN) 
VALUES (501, TO_DATE('2026-05-05', 'YYYY-MM-DD'), 'V12345');

INSERT INTO USES (Job_ID, Part_ID, Quantity) VALUES (501, 101, 1);
INSERT INTO USES (Job_ID, Part_ID, Quantity) VALUES (501, 102, 1);

INSERT INTO Dyno_Test (Test_ID, Job_ID, Horsepower, Torque) VALUES (1, 501, 650, 700);
