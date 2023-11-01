FROM debian:bookworm

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y dumb-init

RUN apt-get install -y openssl nginx

RUN apt-get clean -y

RUN mkdir /etc/nginx/ssl

# Copy NGINX config files
COPY ./conf/nginx.conf /etc/nginx/sites-available/nginx.conf
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# Generate SSL certificate
RUN openssl req -x509 -newkey rsa:4096 -subj "/C=TR/ST=KOCAELI/L=GEBZE/O=42Kocaeli/CN=sciftci.42.fr" -nodes -days 365 -keyout /etc/ssl/nginx.key -out /etc/ssl/nginx.crt

EXPOSE 443

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "nginx", "-g", "daemon off;" ]
