-- Problem 2. Employees with Salary Above Number
CREATE
PROC usp_GetEmployeesSalaryAboveNumber (@Salary DECIMAL(18, 4)) AS
SELECT
    FirstName,
    LastName
FROM Employees
WHERE Salary >= @Salary
