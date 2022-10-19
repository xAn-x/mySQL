CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) 
VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09:00:00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09:00:00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09:00:00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09:00:00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09:00:00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09:00:00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09:00:00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09:00:00', 'Admin');
        


CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATE,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);



INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
        
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) 
VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
 
 
 # ================================= QUESTIONS ================================
 -- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM Worker ;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UCASE(FIRST_NAME) FROM Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT DEPARTMENT FROM Worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT substring(FIRST_NAME,1,3) FROM Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT instr('Amitabh','b');

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(FIRST_NAME) FROM Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(DEPARTMENT) FROM Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT DISTINCT DEPARTMENT,length(DEPARTMENT) FROM WORKER;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT replace(FIRST_NAME,'a','A')  FROM Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT WORKER_ID,concat(TRIM(FIRST_NAME),' ',TRIM(LAST_NAME)) AS COMPLETE_NAME from Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM Worker ORDER BY FIRST_NAME ASC;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM Worker ORDER BY FIRST_NAME ASC , DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE FIRST_NAME IN ('Vipul','Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE FIRST_NAME NOT IN ('Vipul','Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM Worker WHERE DEPARTMENT='Admin';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE('%a%');

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM Worker WHERE FIRST_NAME LIKE('%a');

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM Worker WHERE FIRST_NAME LIKE('%h') AND length(FIRST_NAME)=6;

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Worker WHERE YEAR(JOINING_DATE)='2014' AND MONTH(JOINING_DATE)='02'; 

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT DEPARTMENT,COUNT(DEPARTMENT) FROM Worker WHERE DEPARTMENT='Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT concat(trim(FIRST_NAME),' ',trim(LAST_NAME)) AS FULL_NAME FROM Worker Where SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order accordin to no and a new query acc to department Name.
SELECT DEPARTMENT,count(worker_id) FROM Worker GROUP BY(DEPARTMENT) ORDER BY count(DEPARTMENT) DESC;
SELECT DEPARTMENT,count(worker_id) FROM Worker GROUP BY(DEPARTMENT) ORDER BY DEPARTMENT DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT Worker.* FROM Worker INNER JOIN Title ON Worker.worker_id=Title.Worker_ref_id 
WHERE Title.worker_title='Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT worker_title,count(worker_ref_id) FROM Title GROUP BY (worker_title) having count(worker_ref_id)>1;

-- Q-26. Write an SQL query to show only odd rows from a table.
SELECT * FROM worker WHERE MOD (WORKER_ID, 2) != 0; 

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM worker WHERE MOD (WORKER_ID, 2) = 0; 

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE Worker_clone LIKE Worker;
INSERT INTO Worker_clone SELECT * FROM Worker;
SELECT * FROM Worker_clone;
-- DROP TABLE Worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT Worker.* FROM Worker INNER JOIN Worker_clone USING(worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT Worker.* FROM Worker LEFT JOIN Worker_clone USING(worker_id) 
WHERE Worker_clone.worker_id IS NULL;


-- Q-31. Write an SQL query to show the current date and time.
SELECT CURRENT_Date AS 'Current-Date' , CURRENT_TIME AS 'Current-Time';

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM Worker ORDER BY salary DESC LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker ORDER BY salary DESC LIMIT 1 OFFSET 4; 
-- Method-2
SELECT * FROM Worker ORDER BY salary DESC LIMIT 4,1; 

 
-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
 SELECT * FROM Worker w1
 WHERE 4=(
	SELECT COUNT(DISTINCT (w2.salary))
    FROM Worker w2
    WHERE w2.salary>=w1.salary
 ); 
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT * FROM Worker w1,Worker w2 WHERE w1.salary=w2.salary and w1.worker_id != w2.worker_id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT * FROM Worker w1
 WHERE 2=(
	SELECT COUNT(DISTINCT (w2.salary))
    FROM Worker w2
    WHERE w2.salary>=w1.salary
 ); 

-- Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM Worker
UNION ALL
SELECT * FROM Worker ORDER BY worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
-- MINUS
SELECT Worker.* FROM Worker LEFT JOIN Bonus ON Worker.worker_id=Bonus.worker_ref_id
WHERE Bonus.worker_ref_id IS NULL;

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM Worker WHERE worker_id <= (SELECT COUNT(worker_id)/2 FROM Worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT DEPARTMENT,count(worker_id) FROM Worker GROUP BY DEPARTMENT HAVING count(worker_id)<4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT DEPARTMENT,count(worker_id) FROM Worker GROUP BY DEPARTMENT;

-- Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM Worker WHERE worker_id IN (SELECT MAX(worker_id) FROM Worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM Worker WHERE worker_id IN (SELECT MIN(worker_id) FROM Worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
# METHOD-1
SELECT * FROM Worker ORDER BY worker_id DESC LIMIT 5;
# METHOD-2
SELECT * FROM
(
 SELECT * FROM Worker ORDER BY worker_id DESC LIMIT 5
) AS sub
ORDER BY worker_id ASC;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT Worker.* FROM 
( SELECT worker_id,Max(Salary) FROM Worker GROUP BY (Department) ) temp
INNER JOIN Worker On Worker.worker_id=temp.worker_id;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
-- DRY RUN AFTER REVISING THE CORELATED SUBQUERY CONCEPT FROM LEC-9.

-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
SELECT DISTINCT(Salary) FROM Worker ORDER BY Salary DESC LIMIT 3;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT DISTINCT(Salary) FROM Worker ORDER BY Salary LIMIT 5,1;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT department,sum(salary) FROM Worker GROUP BY department;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
SELECT * FROM Worker WHERE salary in (SELECT MAX(salary) FROM Worker);