-- Problem 11.	Future Value Function
CREATE FUNCTION ufn_CalculateFutureValue(@Sum DECIMAL(20, 2), @YearlyInterest FLOAT, @Years INT)
RETURNS DECIMAL(20, 4) AS
BEGIN
    DECLARE @Result DECIMAL(20, 4) = @Sum * POWER((1 + @YearlyInterest), @Years)
    RETURN @Result
END
GO

-- Check for testing purpose only. Do not submit in Judge
SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5)
