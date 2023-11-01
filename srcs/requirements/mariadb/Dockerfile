FROM        debian:bookworm

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y dumb-init

RUN apt-get install -y mariadb-server expect

RUN apt-get clean -y


RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

COPY ./conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY        conf/mysql_secure_install.sh   /tmp/

RUN chmod +x /tmp/mysql_secure_install.sh

EXPOSE      3306

ENTRYPOINT [ "/tmp/mysql_secure_install.sh" ]
#ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
#CMD  ["sh", "/tmp/mysql_secure_install.sh"]