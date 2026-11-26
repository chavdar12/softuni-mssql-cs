-- Problem 1. Create Table Logs (Bank database)
CREATE TABLE Logs
(
    LogId INT PRIMARY KEY IDENTITY,
    AccountId INT NOT NULL FOREIGN KEY REFERENCES Accounts (Id),
    OldSum MONEY NOT NULL,
    NewSum MONEY NOT NULL
)
GO

CREATE TRIGGER tr_AccountsBalanceChange
ON Accounts
FOR UPDATE
AS
INSERT INTO Logs (AccountId, OldSum, NewSum)
SELECT
    i.Id,
    d.Balance,
    i.Balance
FROM inserted AS i
INNER JOIN deleted AS d ON i.Id = d.Id
WHERE i.Balance <> d.Balance
