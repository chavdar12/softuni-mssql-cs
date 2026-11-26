-- Problem 5.	Employees Without Project
SELECT DISTINCT TOP (3)
    e.EmployeeID,
    e.FirstName
FROM Employees AS e
RIGHT JOIN EmployeesProjects AS ep
    ON e.EmployeeID NOT IN (SELECT DISTINCT ep_sub.EmployeeID FROM EmployeesProjects AS ep_sub)
ORDER BY e.EmployeeID
