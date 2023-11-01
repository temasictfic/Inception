FROM debian:bookworm

ARG DB_DATABASE
ARG DB_USER_NAME
ARG DB_USER_PASSWORD
ARG DB_ROOT_PASSWORD

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y dumb-init

RUN apt-get install -y mariadb-server

RUN apt-get clean -y

# You notice we call mysql and not mariadb. This is because MariaDB
# is a fork of MySQL, even though they are different the name of the
# commands we invoke and folders we use are as if we were using MySQL

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

RUN service mariadb start
RUN echo \
	"CREATE DATABASE IF NOT EXISTS wordpress; \
	CREATE USER IF NOT EXISTS 'sciftci'@'%' IDENTIFIED BY 'sciftci';\
	ALTER USER 'root'@'localhost' IDENTIFIED BY 'root'; \
	GRANT ALL PRIVILEGES ON wordpress.* TO 'sciftci'@'%' IDENTIFIED BY 'sciftci'; \
	FLUSH PRIVILEGES;" > mysql -u root -e

COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD ["mysqld", "--bind-address=0.0.0.0" ]
