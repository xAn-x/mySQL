/* 								GROUP BY
The GROUP BY statement groups rows that have the same values into summary rows, like "find the 
number of customers in each country". 

The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG())
to group the result-set by one or more columns.
*/

USE temp;

# This will give City Name and Count of people from a City
SELECT CITY, COUNT(City) FROM Students GROUP BY(City);

# Find avg age per City->
Select CITY,AVG(AGE) FROM Students GROUP BY(City);

SELECT * from Students;

# Find min Age from from each city->
 Select CITY,MIN(AGE) FROM Students GROUP BY(City);
 
# If U don't put any agregation then defaul agregation is 'DISTINCT'
Select * FROM Students GROUP BY(City); 



#============================= 'HAVING' keyword in SQL ========================
/*
	As We Use 'WHERE' keyword for filtering data while using 'SELECT'
    similarly->
    We use 'HAVING' keyword for filtering data while using 'GROUP BY'
*/ 

# Find all cities from where we have more than or equal to 2 students->
SELECT CITY FROM Students GROUP BY(CITY) HAVING COUNT(ID)>=2;

# Find all cities where avg age of students is greater than or equal to 20->
SELECT CITY,AVG(AGE) FROM Students GROUP BY(CITY) HAVING AVG(AGE)>=20;

DROP DATABASE IF EXISTS temp;