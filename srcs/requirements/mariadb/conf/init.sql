-- Create a new database
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;

-- Create a new user and set a password
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';

-- Grant all privileges to the user on the database
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';

-- Flush privileges to apply the changes
FLUSH PRIVILEGES;

