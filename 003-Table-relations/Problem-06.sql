-- Problem 6 - University Database
CREATE DATABASE UniversityDatabase

CREATE TABLE Majors
(
    MajorID INT PRIMARY KEY IDENTITY, [
    Name]
    VARCHAR(
        50
    )
)

CREATE TABLE Subjects
(
    SubjectID INT PRIMARY KEY IDENTITY,
    SubjectName VARCHAR(50)
)

CREATE TABLE Students
(
    StudentID INT PRIMARY KEY IDENTITY,
    StudentNumber INT NOT NULL,
    StudentName VARCHAR(50) NOT NULL,
    MajorID INT FOREIGN KEY REFERENCES Majors (MajorID)
)

CREATE TABLE Agenda
(
    StudentID INT FOREIGN KEY REFERENCES Students (StudentID),
    SubjectID INT FOREIGN KEY REFERENCES Subjects (SubjectID),
    CONSTRAINT FK_Students_Subjects PRIMARY KEY (StudentID, SubjectID)
)

CREATE TABLE Payments
(
    PaymentID INT PRIMARY KEY IDENTITY,
    PaymentDate DATE,
    PaymentAmount DECIMAL(7, 2) NOT NULL,
    StudentID INT FOREIGN KEY REFERENCES Students (StudentID)
)
