-- Problem 9. Delete Employees (SoftUni database)
CREATE TABLE Deleted_Employees
(
    EmployeeId INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MiddleName VARCHAR(50),
    JobTitle VARCHAR(50) NOT NULL,
    DepartmentId INT NOT NULL,
    Salary MONEY NOT NULL
)
GO

CREATE TRIGGER tr_EmployeesDeleted
ON Employees
FOR DELETE
AS
INSERT INTO Deleted_Employees (EmployeeId, FirstName, LastName, MiddleName, JobTitle, DepartmentId, Salary)
SELECT
    EmployeeID,
    FirstName,
    LastName,
    MiddleName,
    JobTitle,
    DepartmentID,
    Salary
FROM deleted
