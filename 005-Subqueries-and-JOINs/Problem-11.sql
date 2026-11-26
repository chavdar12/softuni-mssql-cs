-- Problem 11.	Min Average Salary
SELECT TOP (1) MinAverageSalary
FROM (
    SELECT AVG(Salary) AS MinAverageSalary
    FROM Employees
    GROUP BY DepartmentID)
    AS AvgSalaries
ORDER BY MinAverageSalary
