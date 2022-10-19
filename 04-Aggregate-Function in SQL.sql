USE temp;

SELECT ADDRESS FROM Students;

-- Count() use to get the count of something --
SELECT count(ADDRESS) FROM Students WHERE ADDRESS="Jamnagar";
SELECT count(AGE) FROM Students WHERE AGE<22;

-- SUM() use add --
SELECT SUM(AGE) FROM Students;

-- MIN()/MAX() use to get min and max value--
SELECT MIN(AGE) FROM Students;

-- AVG() use to get avg --
SELECT AVG(AGE) FROM Students;




-- UPDATE Query in SQL --
SELECT * FROM STUDENT WHERE ID=1;
UPDATE Students SET ADDRESS = "MHOW" WHERE ID=1;

-- DELETE QUery in SQL --
DELETE FROM Students WHERE ID=5;

-- REVERTING BACK DELETED DATA AS I have used it in prv files --
INSERT INTO Students VALUES (5,"Jen","2002-02-02","Jamnagar","1427201292","19");


# Read about commit and rollback command
DROP DATABASE IF EXISTS temp;