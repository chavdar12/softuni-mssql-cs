-- Problem 6. Trigger (Diablo database)
-- 1. Block items whose MinLevel is above the user's level in that game
CREATE TRIGGER tr_RestrictItemsAboveUserLevel
ON UserGameItems
INSTEAD OF INSERT
AS
INSERT INTO UserGameItems (ItemId, UserGameId)
SELECT
    i.ItemId,
    i.UserGameId
FROM inserted AS i
INNER JOIN Items AS it ON i.ItemId = it.Id
INNER JOIN UsersGames AS ug ON i.UserGameId = ug.Id
WHERE it.MinLevel <= ug.[Level]
GO

-- 2. Bonus cash in "Bali"
UPDATE ug
SET Cash += 50000
FROM UsersGames AS ug
INNER JOIN Users AS u ON ug.UserId = u.Id
INNER JOIN Games AS g ON ug.GameId = g.Id
WHERE
    g.Name = 'Bali'
    AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos')

-- 3. Buy items 251-299 and 501-539, charge only for what the trigger lets through
DECLARE @Purchases TABLE (UserGameId INT, ItemId INT, Price MONEY)

INSERT INTO @Purchases (UserGameId, ItemId, Price)
SELECT
    ug.Id,
    it.Id,
    it.Price
FROM UsersGames AS ug
INNER JOIN Users AS u ON ug.UserId = u.Id
INNER JOIN Games AS g ON ug.GameId = g.Id
INNER JOIN Items AS it ON it.Id BETWEEN 251 AND 299 OR it.Id BETWEEN 501 AND 539
WHERE
    g.Name = 'Bali'
    AND u.Username IN ('baleremuda', 'loosenoise', 'inguinalself', 'buildingdeltoid', 'monoxidecos')
    AND it.MinLevel <= ug.[Level]
    AND NOT EXISTS (
        SELECT 1 FROM UserGameItems AS ugi
        WHERE ugi.ItemId = it.Id AND ugi.UserGameId = ug.Id
    )

INSERT INTO UserGameItems (ItemId, UserGameId)
SELECT
    ItemId,
    UserGameId
FROM @Purchases

UPDATE ug
SET Cash -= p.Total
FROM UsersGames AS ug
INNER JOIN (SELECT
    UserGameId,
    SUM(Price) AS Total
FROM @Purchases
GROUP BY UserGameId) AS p
    ON ug.Id = p.UserGameId

-- 4. Users in "Bali" with their items
SELECT
    u.Username,
    g.Name,
    ug.Cash,
    it.Name AS [Item Name]
FROM Users AS u
INNER JOIN UsersGames AS ug ON u.Id = ug.UserId
INNER JOIN Games AS g ON ug.GameId = g.Id
INNER JOIN UserGameItems AS ugi ON ug.Id = ugi.UserGameId
INNER JOIN Items AS it ON ugi.ItemId = it.Id
WHERE g.Name = 'Bali'
ORDER BY u.Username, [Item Name]
