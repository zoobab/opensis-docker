CREATE USER 'sisadmin'@'localhost';
GRANT ALL PRIVILEGES ON *.* to 'sisadmin'@'localhost' WITH GRANT OPTION;
ALTER USER 'sisadmin'@'localhost' IDENTIFIED BY 'sisadmin';
SET GLOBAL sql_mode = 'NO_ENGINE_SUBSTITUTION';
