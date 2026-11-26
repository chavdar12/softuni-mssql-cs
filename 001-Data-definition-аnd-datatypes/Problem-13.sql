-- Problem 13
CREATE DATABASE Movies

CREATE TABLE Directors
(
    Id INT PRIMARY KEY IDENTITY,
    DirectorName NVARCHAR(30) NOT NULL,
    Notes NVARCHAR(200)
)

CREATE TABLE Genres
(
    Id INT PRIMARY KEY IDENTITY,
    GenreName NVARCHAR(30) NOT NULL,
    Notes NVARCHAR(200)
)

CREATE TABLE Categories
(
    Id INT PRIMARY KEY IDENTITY,
    CategoryName NVARCHAR(30) NOT NULL,
    Notes NVARCHAR(150)
)

CREATE TABLE Movies
(
    Id INT PRIMARY KEY IDENTITY,
    Title NVARCHAR(30) NOT NULL,
    DirectorId INT FOREIGN KEY REFERENCES Directors (Id),
    CopyrightYear INT NOT NULL, [
    Length]
    TIME,
    GenreId INT FOREIGN KEY REFERENCES Genres (Id),
    CategoryId INT FOREIGN KEY REFERENCES Categories (Id),
    Rating DECIMAL(2, 1),
    Notes NVARCHAR(MAX
    )
)

INSERT INTO Directors
VALUES ('Ivan Ivanov', 'Golden boot Winner'),
('Stan Petrov', 'Multiple international awards'),
('James Cameron', 'FC Liverpool legend'),
('Sam Mayor', 'MK3 World Champion'),
('Dany De La Hoya', 'Very talented')

INSERT INTO Genres
VALUES ('Comedy', 'Very funny...'),
('Action', 'Weapons mepons'),
('Horror', 'Not for children'),
('SciFi', 'Space and aliens'),
('Drama', 'OMG')

INSERT INTO Categories
VALUES ('1', NULL),
('2', NULL),
('3', NULL),
('4', NULL),
('5', NULL)

INSERT INTO MOVIES
VALUES ('Gosho and the others', 1, 2020, '1:25:00', 1, 1, 9.9, 'Must watch it with popcorns and wiskey')

INSERT INTO Movies
VALUES ('Hmm part 2', 1, 1999, '1:40:00', 2, 4, 5.0, 'SAW'),
('The naked cat', 2, 2999, '1:11:21', 3, 3, 5.3, 'WAS'),
('Joe and his women', 4, 2999, '2:12:21', 4, 2, 5.8, 'Whiskey in the Jar'),
('Mad cat', 3, 2098, '1:30:01', 5, 1, 2.9, 'Rating 10 not supported')
