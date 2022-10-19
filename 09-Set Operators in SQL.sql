CREATE DATABASE IF NOT EXISTS CLG;
USE CLG;



CREATE TABLE Students_t1(
	StudentId INT UNSIGNED PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20)
);

CREATE TABLE Students_t2(
	StudentId INT UNSIGNED PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20)
);

INSERT INTO Students_t1
(StudentId,FirstName,LastName)
VALUE
(1,'Deepanshu','Bhatt'),
(3,'Harsh','Rahadwe'),
(5,'Harsh','Maheshwari'),
(6,'Rahul','Bhatt');

INSERT INTO Students_t2
(StudentId,FirstName,LastName)
VALUE
(1,'Deepanshu','Bhatt'),
(2,'Abu','Sheik'),
(5,'Harsh','Maheshwari'),
(10,'James','Kapoor'),
(4,'Ram','Charan');

SELECT * FROM Students_t1;
SELECT * FROM Students_t2;


-- Tab1 UNION Tab2 => All distinct unqiue tupels from Tab1 and Tab2
SELECT * FROM Students_t1
UNION
SELECT * FROM Students_t2;


-- Tab1 UNION ALL Tab2 => All  tupels from Tab1 and Tab2 =>
SELECT * FROM Students_t1
UNION ALL
SELECT * FROM Students_t2;


-- INTERECT => ALL common tuples among Tab1 and Tab2
-- INTERECT Does Not Exist in SQL but we can emulate it using below syntax
SELECT DISTINCT Students_t1.* FROM Students_t1
INNER JOIN 
Students_t2 USING(StudentId);


-- Tab1 MINUS Tab2 => Everything in Tab1 that is not in Tab2
-- We dont have MINUS in MYSQL so we emulatge it too using below Syntax=>
Select Students_t1.* FROM Students_t1
Left JOIN
Students_t2 Using(StudentId)
Where
(Students_t2.StudentID IS NULL);

DROP DATABASE IF EXISTS CLG;

