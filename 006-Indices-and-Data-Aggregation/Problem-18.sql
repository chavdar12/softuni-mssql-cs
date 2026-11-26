-- Problem 18.	*3rd Highest Salary
SELECT
    tt.DepartmentID,
    tt.Salary AS ThirdHighestSalary
FROM (SELECT
    DepartmentID,
    Salary,
    DENSE_RANK()
        OVER
        (PARTITION BY DepartmentID ORDER BY Salary DESC) AS OrderedSalaries
FROM Employees) AS tt
WHERE OrderedSalaries = 3
GROUP BY
    tt.DepartmentID,
    tt.Salary
