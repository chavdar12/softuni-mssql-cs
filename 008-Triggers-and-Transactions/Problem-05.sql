-- Problem 5. Money Transfer (Bank database, needs Problems 3 and 4)
CREATE PROC usp_TransferMoney (@SenderId INT, @ReceiverId INT, @Amount DECIMAL(18, 4))
AS
BEGIN
    BEGIN TRANSACTION
    BEGIN TRY
        EXEC usp_WithdrawMoney @SenderId, @Amount
        EXEC usp_DepositMoney @ReceiverId, @Amount
        COMMIT
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW
    END CATCH
END
