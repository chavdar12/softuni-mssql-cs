-- Problem 9.	Find Full Name
CREATE PROC usp_GetHoldersFullName AS
BEGIN
    SELECT FirstName + ' ' + LastName AS [Full Name] FROM AccountHolders

END
GO

-- Test call, run separately
EXEC usp_GetHoldersFullName
