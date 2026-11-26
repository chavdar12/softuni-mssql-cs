-- Problem 15. *Continents and Currencies
SELECT
    ContinentCode,
    CurrencyCode,
    CurrencyUsage
FROM (SELECT
    ContinentCode,
    CurrencyCode,
    COUNT(*) AS CurrencyUsage,
    DENSE_RANK() OVER (PARTITION BY ContinentCode ORDER BY COUNT(*) DESC) AS CurrencyRank
FROM Countries
GROUP BY ContinentCode, CurrencyCode) AS RankedCurrencies
WHERE
    CurrencyRank = 1
    AND CurrencyUsage > 1
ORDER BY ContinentCode
