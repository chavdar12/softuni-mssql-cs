-- Problem 3. Town Names Starting With
CREATE
PROC usp_GetTownsStartingWith (@Start NVARCHAR(20)) AS
BEGIN
    SELECT Name AS Town
    FROM Towns
    WHERE Name LIKE @Start + '%'
END
GO

-- Do not paste this in Judge. It's for testing purpose only.
EXEC usp_GetTownsStartingWith 'b'
