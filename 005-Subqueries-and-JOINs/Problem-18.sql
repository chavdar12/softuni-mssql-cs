-- Problem 18. * Highest Peak Name and Elevation by Country
SELECT DISTINCT TOP (5)
    Country,
    [Highest Peak Name],
    [Highest Peak Elevation],
    Mountain
FROM (
    SELECT
        c.CountryName AS Country,
        ISNULL(p.PeakName, '(no highest peak)') AS [Highest Peak Name],
        ISNULL(p.Elevation, 0) AS [Highest Peak Elevation],
        IIF(p.PeakName IS NULL, '(no mountain)', m.MountainRange) AS Mountain,
        -- ties on elevation share rank 1, so all highest peaks are shown
        DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY p.Elevation DESC) AS PeakRank
    FROM Countries AS c
    LEFT JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
    LEFT JOIN Mountains AS m ON mc.MountainId = m.Id
    LEFT JOIN Peaks AS p ON m.Id = p.MountainId
) AS RankedPeaks
WHERE PeakRank = 1
ORDER BY Country, [Highest Peak Name]
