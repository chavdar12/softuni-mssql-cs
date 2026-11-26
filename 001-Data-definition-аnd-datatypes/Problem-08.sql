-- Problem 8
CREATE TABLE Users
(
    Id BIGINT IDENTITY,
    Username VARCHAR(30) UNIQUE NOT NULL, [
    Password]
    VARCHAR(
        26
    ) NOT NULL,
    ProfilePicture VARBINARY(MAX) CHECK (DATALENGTH(ProfilePicture) <= 900 * 1024),
    LastLoginTime DATETIME,
    IsDeleted BIT
    CONSTRAINT PK_Users PRIMARY KEY (Id)
)

INSERT INTO Users
VALUES ('Gosho', '21512', NULL, NULL, 0),
('Ivan', '21513', NULL, NULL, 1),
('Ivgo', '21514', NULL, NULL, 0),
('Goiv', '21515', NULL, NULL, 1),
('Ogvi', '21516', NULL, NULL, 0)
