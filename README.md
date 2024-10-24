This is my implementation of the Lecturer Claim Management System
The Program will consists of three types of uses 
Lecturers , coordinators and managers
Lecturers will be able to write out their claims on the lecturers claim page 
They will be able to check where there its been approved or rejected by coordinators and managers on the claim status page  
Coordinators will be able to approve of claims on the coordinatora approvol page
Managers will be able to approve of claims in the manager approval page 
All claims and their approval status will be recorderd on a Sql database 

 - Create the database
CREATE DATABASE POE_PART2;

-- Use the database
USE POE_PART2;

-- Create the Claims_TBL table
CREATE TABLE Claims_TBL (
    Claim_ID INT PRIMARY KEY IDENTITY(1,1),
    Lecturer_ID NVARCHAR(50),
    Lecturer_Name NVARCHAR(100),
    Hours_Worked DECIMAL(10,2),
    Base_Rate DECIMAL(10,2),
    Program_Code NVARCHAR(50),
    Module_Name NVARCHAR(100),
    File_Upload NVARCHAR(255), -- Assuming a file path or filename is stored here
    Status NVARCHAR(50) -- E.g., Pending, Approved, Rejected , 
    Cooridnator_Approval NVARCHAR(50) -- E.g., Pending, Approved, Rejected , 
    Manager_Approval NVARCHAR(50) -- E.g., Pending, Approved, Rejected
);


