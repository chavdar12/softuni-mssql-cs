-- Problem 13 - Mix of Peak and River Names
SELECT
    p.PeakName,
    r.RiverName,
    LOWER(PeakName + SUBSTRING(RiverName, 2, LEN(RiverName) - 1)) AS Mix
FROM Peaks AS p
INNER JOIN Rivers AS r
    ON RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix
