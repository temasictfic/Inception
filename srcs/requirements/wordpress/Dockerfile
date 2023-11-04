# Use a lightweight base image
FROM debian:bookworm-slim

# Combine the update and upgrade commands into one to minimize image layers
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y dumb-init curl less php-fpm php-mysql php-mysqli mariadb-client && \
    apt-get clean -y

# Install the WordPress CLI directly from the official repository
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

# Create the directory for WordPress files
RUN mkdir -p /var/www/html/wordpress

# Copy configuration files
COPY ./tools/setup.sh /tmp/
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

# Expose the PHP-FPM port
EXPOSE 9000

# Combine ENTRYPOINT and CMD for a single command
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ] 
CMD ["/bin/bash", "/tmp/setup.sh"]
