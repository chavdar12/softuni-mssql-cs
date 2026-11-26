-- Problem 9 - Peaks in Rila
SELECT
    Mountains.MountainRange,
    Peaks.PeakName,
    Peaks.Elevation
FROM Mountains
INNER JOIN Peaks ON Mountains.Id = Peaks.MountainId
WHERE Mountains.MountainRange = 'Rila'
ORDER BY Peaks.Elevation DESC
