-- Problem 19
SELECT TOP (10)
    [Name],
    [Description],
    StartDate,
    EndDate
FROM Projects
ORDER BY StartDate, [Name]
