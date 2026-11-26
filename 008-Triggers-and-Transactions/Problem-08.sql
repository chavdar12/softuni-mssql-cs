-- Problem 8. Employees with Three Projects (SoftUni database)
CREATE PROC usp_AssignProject (@EmployeeId INT, @ProjectId INT)
AS
BEGIN
    BEGIN TRANSACTION

    INSERT INTO EmployeesProjects (EmployeeID, ProjectID)
    VALUES (@EmployeeId, @ProjectId)

    IF (
        SELECT COUNT(*) FROM EmployeesProjects
        WHERE EmployeeID = @EmployeeId
    ) > 3
        BEGIN
            ROLLBACK
            RAISERROR ('The employee has too many projects!', 16, 1)
            RETURN
        END

    COMMIT
END
