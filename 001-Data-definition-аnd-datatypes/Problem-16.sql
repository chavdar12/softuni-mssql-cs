-- Problem 16
CREATE DATABASE SoftUni

CREATE TABLE Towns
(
    Id INT PRIMARY KEY IDENTITY, [
    Name]
    NVARCHAR(
        50
    ) NOT NULL
)

CREATE TABLE Addresses
(
    Id INT PRIMARY KEY IDENTITY,
    AddressText NVARCHAR(120) NOT NULL,
    TownId INT FOREIGN KEY REFERENCES Towns (Id) NOT NULL
)

CREATE TABLE Departments
(
    Id INT PRIMARY KEY IDENTITY, [
    Name]
    NVARCHAR(
        50
    ) NOT NULL
)

CREATE TABLE Employees
(
    Id INT PRIMARY KEY IDENTITY,
    FirstName NVARCHAR(50) NOT NULL,
    MiddleName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    JobTitle NVARCHAR(50) NOT NULL,
    DepartmentId INT FOREIGN KEY REFERENCES Departments (Id) NOT NULL,
    HireDate DATE,
    Salary DECIMAL(8, 2),
    AddressId INT FOREIGN KEY REFERENCES Addresses (Id)
)
