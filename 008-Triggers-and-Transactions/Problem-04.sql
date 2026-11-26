-- Problem 4. Withdraw Money (Bank database)
CREATE PROC usp_WithdrawMoney (@AccountId INT, @MoneyAmount DECIMAL(18, 4))
AS
BEGIN
    IF @MoneyAmount <= 0
        THROW 50001, 'Money amount must be positive.', 1;

    UPDATE Accounts
    SET Balance -= @MoneyAmount
    WHERE
        Id = @AccountId
        AND Balance >= @MoneyAmount;

    IF @@ROWCOUNT = 0
        THROW 50003, 'Account does not exist or has insufficient funds.', 1;
END
