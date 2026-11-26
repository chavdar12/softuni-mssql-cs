-- Problem 5.	Salary Level Function
CREATE FUNCTION ufn_GetSalaryLevel(@Salary DECIMAL(18, 4))
RETURNS NVARCHAR(20) AS
BEGIN
    DECLARE @CurrentSalary NVARCHAR(25)
    SET
        @CurrentSalary
        = CASE
            WHEN @Salary < 30000 THEN 'Low'
            WHEN @Salary <= 50000 THEN 'Average'
            ELSE 'High'
        END
    RETURN @CurrentSalary
END
GO

-- Do not paste this in Judge. It's for testing purpose only.
SELECT
    Salary,
    dbo.ufn_GetSalaryLevel(Salary) AS [Salary Level]
FROM Employees
