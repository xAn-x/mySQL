USE temp;

INSERT INTO  Students
(ID,STUDENT_NAME,DOB,CITY,MOBILE_NO,AGE)
VALUES
(4,"Jhon","2000-01-01","Jamnagar","142728732","23"),
(5,"Jen","2002-02-02","Jamnagar","1427201292","19"),
(6,"Dheeraj","2003-01-01","agra","142728732","18"),
(7,"Rahul Nene","1995-01-01","Jamnagar","1427122121","28"),
(8,"Jasmine","2000-01-01","Delhi","142787322","23");

SELECT * FROM Students;

# %  ->use for multiple char
# _  ->use for single char  

-- START With D ---
SELECT * FROM Students WHERE STUDENT_NAME LIKE("D%");
-- End with n --
SELECT * FROM Students WHERE STUDENT_NAME LIKE("%n");
-- Has ee --
SELECT * FROM Students WHERE STUDENT_NAME LIKE("%ee%");
-- Has e in second pos --
SELECT * FROM Students WHERE STUDENT_NAME LIKE("_e%");
-- Has n in second last position or start with j--
SELECT * FROM Students WHERE STUDENT_NAME LIKE("%n_") || STUDENT_NAME LIKE("j%");

DROP DATABASE IF EXISTS temp;