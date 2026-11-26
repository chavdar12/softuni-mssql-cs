-- Problem 15.	Employees Average Salaries
SELECT *
INTO #tempTable
FROM Employees
WHERE Salary > 30000

DELETE
FROM #tempTable
WHERE ManagerID = 42

UPDATE #tempTable
SET Salary += 5000
WHERE DepartmentID = 1

SELECT
    DepartmentID,
    AVG(Salary) AS AverageSalary
FROM #tempTable
GROUP BY DepartmentID
