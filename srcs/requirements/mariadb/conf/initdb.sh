#!/bin/bash

mysql -u root -e \
"CREATE DATABASE IF NOT EXISTS $DB_DATABASE; \
CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'localhost' IDENTIFIED BY '$DB_USER_PASSWORD'; \
GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD'; \
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'; \
FLUSH PRIVILEGES;"
