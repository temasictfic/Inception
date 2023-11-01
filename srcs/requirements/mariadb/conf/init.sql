-- Create a new database
CREATE DATABASE IF NOT EXISTS $DB_DATABASE;

-- Create a new user and set a password
CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'localhost' IDENTIFIED BY '$DB_USER_PASSWORD';

-- Grant all privileges to the user on the database
GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER_NAME'@'localhost';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
