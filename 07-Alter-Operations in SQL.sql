# ========== ALTER OPERATIONS ===========
/*
	Alter Operations are use to redefine or to make changes in things that are already present in 
    out database
    
    For EG->
    
    @ ADD => adds new column in a table
    @ MODIFY => Change datatype of an attribute
    @ Rename COLUMN => Old-Column-Name TO New-Column-Name
    @ Drop Column => Delete a Column
    @ Rename => Rename Table
*/ 

CREATE DATABASE IF NOT EXISTS CLG;
USE CLG;

Create Table Students(
	ID INT UNSIGNED PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) ,
    Age TINYINT UNSIGNED,
    
    CONSTRAINT Age_Constraint CHECK (Age>=18)
);


# Add Column For
ALTER TABLE Students
	ADD MobileNo INT NOT NULL,
    ADD EmailId VARCHAR(30) UNIQUE;
    

# Remove Column 
ALTER TABLE Students
	DROP LastName ;
 
 
 # Rename Column
 ALTER TABLE Students
	RENAME COLUMN FirstName TO StudentName;


# Rename Table->
ALTER Table Students
	RENAME StudentData;
    

# NOTE We can perform all these alter oprn under one {{ALTER TABLE}} 
    
DROP TABLE StudentData;
DROP DATABASE CLG;

