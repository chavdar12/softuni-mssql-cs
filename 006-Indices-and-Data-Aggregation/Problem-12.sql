-- Problem 12.	* Rich Wizard, Poor Wizard
SELECT ABS(SUM(tt.DepositDifference)) AS SumDifference
FROM (
    SELECT wiz1.DepositAmount - wiz2.DepositAmount AS DepositDifference
    FROM WizzardDeposits AS wiz1
    INNER JOIN WizzardDeposits AS wiz2 ON wiz1.Id = (wiz2.Id + 1)
) AS tt
