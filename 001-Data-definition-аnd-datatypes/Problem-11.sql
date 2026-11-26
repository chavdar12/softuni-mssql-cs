-- Problem 11

ALTER TABLE Users
ADD CONSTRAINT Default_Users_LastLoginTime
DEFAULT GETDATE() FOR LastLoginTime
