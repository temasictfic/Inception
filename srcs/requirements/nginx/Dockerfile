# Use a smaller base image
FROM debian:bookworm-slim

# Install packages and clean up in a single step to reduce image size
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y dumb-init openssl nginx \
    && apt-get clean -y

# Generate SSL certificate with a more informative subject
RUN openssl req -x509 -newkey rsa:4096 -subj '/CN=sciftci.42.fr' -nodes -days 365 -keyout /etc/ssl/sciftci.42.fr.key -out /etc/ssl/sciftci.42.fr.crt

# Copy NGINX config files
COPY conf/nginx.conf /etc/nginx
COPY conf/default.conf /etc/nginx/sites-enabled/default

# Enable the site by creating a symbolic link
#RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Expose the required port
EXPOSE 443

# Use CMD instead of ENTRYPOINT to make it easier to override
ENTRYPOINT [ "/usr/bin/dumb-init", "--" ] 
CMD ["nginx", "-g", "daemon off;"]

