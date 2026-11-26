-- Problem 13.	Count Mountain Ranges
SELECT
    CountryCode,
    COUNT(MountainId) AS MountainRanges
FROM MountainsCountries
WHERE CountryCode IN ('US', 'BG', 'RU')
GROUP BY CountryCode
