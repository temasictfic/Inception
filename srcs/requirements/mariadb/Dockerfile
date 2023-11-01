FROM debian:bookworm-slim

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y dumb-init mariadb-server \
    && apt-get clean -y

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy the SQL initialization script into the container
COPY ./conf/init.sh /tmp/

RUN service mariadb start && /bin/bash /tmp/init.sh

# Start MariaDB service
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ] 
CMD ["mysqld", "--bind-address=0.0.0.0"]

EXPOSE 3306

