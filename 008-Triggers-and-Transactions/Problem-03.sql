-- Problem 3. Deposit Money (Bank database)
CREATE PROC usp_DepositMoney (@AccountId INT, @MoneyAmount DECIMAL(18, 4))
AS
BEGIN
    IF @MoneyAmount <= 0
        THROW 50001, 'Money amount must be positive.', 1;

    UPDATE Accounts
    SET Balance += @MoneyAmount
    WHERE Id = @AccountId;

    IF @@ROWCOUNT = 0
        THROW 50002, 'Account does not exist.', 1;
END
