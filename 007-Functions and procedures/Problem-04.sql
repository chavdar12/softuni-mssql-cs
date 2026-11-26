-- Problem 4.	Employees from Town
CREATE PROC usp_GetEmployeesFromTown (@Town NVARCHAR(50)) AS
BEGIN
    SELECT
        FirstName,
        LastName
    FROM Employees AS e
    INNER JOIN Addresses AS a
        ON e.AddressID = a.AddressID
    INNER JOIN Towns AS t
        ON a.TownID = t.TownID
    WHERE t.Name = @Town

END
GO

-- Do not paste this in Judge. It's for testing purpose only.
EXEC usp_GetEmployeesFromTown 'sofia'
