#!/bin/bash

mysqld_safe &;

mysql -uroot <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
EOF

kill `cat /var/run/mysqld/mysqld.pid`

service start mariadb

mysql -uroot -p$DB_ROOT_PASSWORD <<EOF
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $DB_DATABASE;
CREATE USER IF NOT EXISTS '$DB_USER_NAME'@localhost IDENTIFIED BY '$DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER_NAME'@localhost;
FLUSH PRIVILEGES;
EOF