# 🚗 Automotive Modification Shop - Database Design

## 📌 Overview
This project presents a complete relational database design and implementation for an automotive modification shop. It manages customer details, vehicle tracking, specific modification jobs, spare parts usage, warranties, and performance testing (Dyno Tests).

## 📊 Entity-Relationship Diagram (ERD)
The conceptual design follows the Chen Notation, detailing entities, attributes, and relationships with proper cardinality and participation constraints.

![ERD Diagram](erاخر تعديل انشاء الله.drawio.pdf)
*(Note: Replace `اسم_صورة_الـERD_بتاعتك.png` with the exact name of the uploaded ERD image file)*

## 🗄️ Relational Schema
The logical design translated from the ERD, defining Primary Keys (PK) and Foreign Keys (FK) to maintain referential integrity.

![Schema Diagram](schemaاخر تعديل انشاء الله.drawio.pdf)
*(Note: Replace `اسم_صورة_الـSchema_بتاعتك.png` with the exact name of the uploaded Schema image file)*

## 💻 Database Implementation (DDL & DML)
The repository includes SQL scripts for creating the database structure and populating it with realistic mock data.

### Example Table Creation
```sql
-- Creating the Modification_Job table with Foreign Key linking to Vehicle
CREATE TABLE Modification_Job (
    Job_ID INT PRIMARY KEY,
    Job_Date DATE NOT NULL,
    VIN VARCHAR(50),
    FOREIGN KEY (VIN) REFERENCES Vehicle(VIN) ON DELETE CASCADE
);
