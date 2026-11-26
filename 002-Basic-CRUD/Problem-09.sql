-- Problem 9
SELECT
    FirstName,
    LastName,
    JobTitle
FROM Employees
WHERE
    Salary >= 20000
    AND Salary <= 30000
