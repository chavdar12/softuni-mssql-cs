-- Problem 8 - Create View Employees Hired After 2000 Year
CREATE VIEW v_EmployeesHiredAfter2000 AS
SELECT
    FirstName,
    LastName
FROM Employees
WHERE DATEPART(YEAR, HireDate) > 2000
-- 
SELECT * FROM V_EmployeesHiredAfter2000
