# Create a database if it doesn't exist  
CREATE DATABASE IF NOT EXISTS temp;

# Use the database
USE temp;

CREATE TABLE Students (
	ID INT PRIMARY KEY,
    STUDENT_NAME VARCHAR(50) NOT NULL,
    DOB DATE,
    CITY VARCHAR(25),
    MOBILE_NO VARCHAR(15),
    AGE TINYINT UNSIGNED NOT NULL
);

#To Insert data into table use this syntax
INSERT INTO Students
	(ID,STUDENT_NAME,DOB,CITY,MOBILE_NO,AGE)
VALUES
	(1,'Deepanshu Bhatt','2002-07-30','Mhow','13579246',19),
    (2,'Rahul Bhatt','2001-03-13','Pune','192323246',20),
    (3,'Sam Singh','1999-01-01','Pune','1357932246',22);
    
#Select everything from the table 
SELECT * FROM Students;

#We can select specefic field also
SELECT STUDENT_NAME,CITY,AGE FROM Students; 

#We can Select According to conds also
SELECT * FROM Students WHERE (City='Pune') ;


# ======= UPDATE ROWS =========
Update Students SET CITY='Indore',STUDENT_NAME='Rajeev Bhatt' Where ID=2 ; 
# To Update in every Row=> Update Tabele_Name {{CHANGES}}


# ======= Delete ROWS ======
DELETE FROM Students WHERE ID=2;
# To Delete all rows -> DELETE From TABLE_NAME


# ====== REPLACE =======
-- Replace acts like update if data is already +nt and like insert if not 

Replace INTO Students
-- PRimary Key is mst as oprns are perform according to it only
(ID,STUDENT_NAME,DOB,AGE)
VALUE
(2,'Rajeev Chaurasiya','1999-05-23',24);


# To Remove the table 
DROP TABLE Students;
# To remove DB
DROP DATABASE IF EXISTS temp;