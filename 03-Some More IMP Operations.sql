USE temp;

-- BETWEEN AND NOT BETWEEN in SQL --
-- Get data of all Studentss whose age is b/w 18 and 20
SELECT * FROM Students WHERE AGE BETWEEN 18 and 20;
-- Get data of all Studentss whose age is not in b/w 18 and 20
SELECT * FROM Students WHERE AGE NOT BETWEEN 18 and 20;



#  'In' in SQL is used to reduce 'OR' condn in S
SELECT * FROM Students Where City in('Pune','Delhi');


-- ORDER BY in SQL --
-- Sort data in asc order wrt to name
SELECT * FROM Students ORDER BY STUDENT_NAME ASC , AGE DESC;


-- DISTINCT IN SQL--
SELECT DISTINCT ADDRESS FROM Students ORDER BY ADDRESS ASC;


-- Limit in SQL --
# Limit use to get only specified amount of result
SELECT * FROM Students ORDER BY AGE DESC LIMIT 3;

-- OFFSET in SQL --
# Offset is use to specify the start of something/how many to skip from start can be use with limit only
SELECT * FROM Students LIMIT 5 OFFSET 3;

DROP DATABASE IF EXISTS temp;