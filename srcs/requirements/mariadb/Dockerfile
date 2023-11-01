FROM debian:bookworm-slim

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y dumb-init mariadb-server mariadb-client \
    && apt-get clean -y

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the SQL initialization script into the container
COPY ./conf/init.sql /docker-entrypoint-initdb.d/

# Start MariaDB service
CMD ["dumb-init", "mysqld", "--bind-address=0.0.0.0"]

EXPOSE 3306

