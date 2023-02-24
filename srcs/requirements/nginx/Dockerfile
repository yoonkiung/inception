FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install nginx -y && \
    apt-get install openssl -y && \
    openssl genrsa -out server.key 4096 && \ 
    openssl req -new -key server.key -subj "/C=KR/ST=Seoul/O=42Seoul/OU=Kiyoon" -out server.csr && \
    openssl req -x509 -in server.csr -key server.key -out server.crt && \
    mv server.crt /etc/ssl/certs/ && \
    mv server.csr server.key /etc/ssl/private && \
    rm -rf /etc/nginx/conf.d/default.conf

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
# COPY ./phpinfo.php /var/www/html/phpinfo.php

ENTRYPOINT nginx -g 'daemon off;'

EXPOSE 443