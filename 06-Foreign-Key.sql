#=========== FOREIGN-KEY ================
/*
The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.

A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in
another table.

The table with the foreign key is called the child table, and the table with the primary key is called 
the referenced or parent table.
*/ 

CREATE DATABASE IF NOT EXISTS Restraunt;

USE Restraunt;


CREATE TABLE Persons(
	PersonID INT PRIMARY KEY AUTO_INCREMENT,
    LastName VARCHAR(25),
    FirstName VarChar(25),
    Age TINYINT UNSIGNED,
    
    # Putting Contraint in age with Name AGE_Constraint
    CONSTRAINT Age_Constraint CHECK (Age>=18)
);

CREATE TABLE Orders(
	OrderId INT UNSIGNED  KEY AUTO_INCREMENT,
    OrderNum INT NOT NULL,
    PersonId INT,
    FOREIGN KEY (PersonId) REFERENCES Persons(PersonId)
);

INSERT INTO Persons
(LastName,FirstName,Age)
VALUE
	('Sharma','Raj',30),
    ('Iqbal','Ali',34),
    ('Jain','Rajeev',31),
    ('Bhatt','Deepanshu',19),
    ('Maheshwari','Harsh',18),
    ('Rahadwe','Harsh',19);
    
INSERT INTO Orders
(OrderNum,PersonId)
VALUES
	(77895,3),
    (44678,3),
    (22456,2),
	(12345,5);

SELECT * FROM Orders;
SELECT * FROM Persons;

#======== Will Not let it as age-constraint is voilated ======
# INSERT INTO Persons
# (LastName,FirstName,Age)
# VALUE
# 	('Bhatt','Deepanshu',20)

Drop DATABASE restraunt;     

# Read About-> ON-Delete-Cascade and On-Delete-SET-Null  