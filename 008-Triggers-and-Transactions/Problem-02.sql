-- Problem 2. Create Table Emails (Bank database, needs Logs from Problem 1)
CREATE TABLE NotificationEmails
(
    Id INT PRIMARY KEY IDENTITY,
    Recipient INT NOT NULL FOREIGN KEY REFERENCES Accounts (Id),
    [Subject] NVARCHAR(100) NOT NULL,
    Body NVARCHAR(MAX) NOT NULL
)
GO

CREATE TRIGGER tr_LogsNotificationEmails
ON Logs
FOR INSERT
AS
INSERT INTO NotificationEmails (Recipient, [Subject], Body)
SELECT
    AccountId,
    CONCAT('Balance change for account: ', AccountId),
    -- style 100 gives "Sep 12 2016  2:09PM"
    CONCAT(
        'On ', CONVERT(VARCHAR(30), GETDATE(), 100), ' your balance was changed from ',
        OldSum, ' to ', NewSum, '.'
    )
FROM inserted
