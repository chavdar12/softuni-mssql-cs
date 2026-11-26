-- Problem 17
CREATE VIEW V_EmployeeNameJobTitle AS
SELECT
    FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS [Full Name],
    JobTitle
FROM Employees
