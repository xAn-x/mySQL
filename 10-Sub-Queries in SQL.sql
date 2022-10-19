-- SUB-Query => Alternative for JOIN in SQL
-- SYNTAX => Outer_quey(Inner_query) and generally Outer_query depends on Inner_query
-- So Firstly Inner_query will bqe executed and then Outer_query will work over that.students
Create DATABASE IF NOT EXISTS School;
USE School;

CREATE Table Students(
	ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20),
    Email VARCHAR(50) UNIQUE NOT NULL,
    Age TINYINT NOT NULL,
    
    CONSTRAINT Age_Constraint CHECK (AGE>=5 and AGE<=20)
);

INSERT INTO Students
(FirstName,LastName,Email,Age)
VALUES
('Neeha','Sharma','nehasharma123@gmail.com',16),
('Ravi','Shastri','drukenravi12@gmail.com',20),
('Abdul','Kaif','tiktik321@pmail.com',14),
('James','Jose','converttochristianity@church.com',16),
('Harsheel','Pandit','jaishreeram.bolo@gmail.com',17),
('Deepanshu','Bhatt','helloWorld@gmail.com',16),
('Ram','Rheem','iloveradhema@sexypandit.com',20);



-- Find All Students Age in (16,17,11,10)
-- OUTER-QUERY										INNER-QUERY
SELECT * FROM Students WHERE ID IN (SELECT ID FROM Students Where Age IN(16,17,11,10));



-- Find All Students who have same age fellows in school
-- OUTER-QUERY										INNER-QUERY
SELECT * FROM Students WHERE AGE IN (SELECT AGE FROM Students GROUP BY AGE HAVING( COUNT(AGE)>1 ));


-- Find Max Age Persons whose first name contains a letter 'ee'
 SELECT MAX(AGE) FROM (SELECT * FROM Students Where FirstName LIKE('%ee%')) AS TEMP;
 
 -- Find details of all students whose age>avg_age
SELECT * FROM Students WHERE AGE < (SELECT AVG(Age) FROM Students);



# ========== CORRELATED SUBQUERIES ============
-- Here Inner Query and outer Query depends on each other to work properly