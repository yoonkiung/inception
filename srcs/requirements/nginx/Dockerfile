FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install nginx -y && \
    apt-get install openssl -y && \
    mkdir CERTS_
    openssl req -x509 -days 30 -nodes -newkey rsa:2048 \
   -keyout ${CERTS_}nginx-ssl.key -out ${CERTS_}nginx-ssl.crt

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY ./index.html /usr/share/nginx/html/index.html

ENTRYPOINT nginx -g 'daemon off;'

