-- Problem 10
ALTER TABLE Users
ADD CONSTRAINT PasswordCheck CHECK (LEN([Password]) >= 5)
