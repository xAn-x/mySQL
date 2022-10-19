/* 	
A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

====Different Types of SQL JOINs===
	Here are the different types of the JOINs in SQL:
    
    (INNER) JOIN: Returns records that have matching values in both tables
    LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table
    RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table
    FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table
*/

USE restraunt;
SELECT * FROM Orders;
SELECT * FROM Persons;

-- INNER JOIN
SELECT O.* , P.* FROM Persons AS P INNER JOIN Orders AS O ON O.PersonId=P.PersonID;

-- LEFT JOIN=> all data from left table + matched data
SELECT O.*,P.* FROM Persons AS P LEFT JOIN Orders AS O  ON O.PersonId=P.PersonID;

-- RIGHT JOIN=> all data from right table + matched data
SELECT O.*,P.* FROM Persons AS P RIGHT JOIN Orders AS O ON O.PersonId=P.PersonID;

-- FULL JOIN= all data => LEFT JOIN UNION RIGHT JOIN
SELECT O.*,P.* FROM Persons AS P LEFT JOIN Orders AS O ON O.PersonId=P.PersonID
UNION
SELECT O.*,P.* FROM Persons AS P RIGHT JOIN Orders AS O ON O.PersonId=P.PersonID;

-- Read About Cross Join and self Join


/* 	===== Can We join 2 tables without using JOIN KeyWord =====
	YES We can 
    SYNTAX=>
		Select * FROM leftTable,rightTable Where leftTable.id=rightTable.id
*/