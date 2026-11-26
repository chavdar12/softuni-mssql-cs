-- Problem 7
CREATE TABLE People
(
    Id INT PRIMARY KEY IDENTITY, [
    Name]
    NVARCHAR(
        200
    ) NOT NULL,
    Picture VARBINARY(MAX) CHECK (DATALENGTH(Picture) > 1024 * 1024 * 2),
    Height DECIMAL(3, 2),
    [Weight] DECIMAL(5, 2),
    Gender CHAR(1) CHECK (Gender = 'm' OR Gender = 'f') NOT NULL,
    Birthdate DATE NOT NULL,
    Biography NVARCHAR(MAX)
)

INSERT INTO People (Name, Picture, Height, [Weight], Gender, Birthdate, Biography)
VALUES ('Ivan O', NULL, 1.24, 55.00, 'm', CONVERT(DateTime, '20000525', 112), 'Mamuna'),
('Ivan X', NULL, 1.44, 55.00, 'm', CONVERT(DateTime, '20000515', 112), 'Kosmos'),
('Ivan Y', NULL, 1.54, 55.00, 'm', CONVERT(DateTime, '20000512', 112), 'Shklyokavitsa'),
('Ivan Z', NULL, 1.64, 55.00, 'm', CONVERT(DateTime, '20000522', 112), '������������'),
('Ivan F', NULL, 1.74, 55.00, 'm', CONVERT(DateTime, '20000523', 112), '���������')
