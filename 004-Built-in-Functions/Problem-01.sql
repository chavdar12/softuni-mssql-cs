-- Problem 1 - Find Names of All Employees by First Name
SELECT
    FirstName,
    LastName
FROM Employees
WHERE LEFT(FirstName, 2) = 'SA'
