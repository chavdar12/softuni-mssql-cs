-- Problem 13.	Departments Total Salaries
-- USE SoftUni
SELECT
    DepartmentId,
    SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
