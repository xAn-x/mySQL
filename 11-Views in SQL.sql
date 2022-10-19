-- Views=> Diffrent views/lvl of abstaction for Diffrent lvl
 
 USE School;
 
 SELECT * FROM Students;
 
 -- Defining view 
 CREATE VIEW custom_view AS SELECT FirstName,LastName FROM Students;
 
 SELECT * From custom_view;
 
 -- Can Alter The view Also
 ALTER VIEW custom_view 
 AS
 SELECT FirstName,Age FROM Students;
 
  SELECT * From custom_view;
  
  -- Droping the view
  y
  DROP VIEW IF EXISTS custom_view;