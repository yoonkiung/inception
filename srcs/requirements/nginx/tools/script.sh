#!/bin/bash

set -e
set -x

openssl genrsa -out server.key 4096
openssl req -new -key server.key -subj "/C=KR/ST=Seoul/O=42Seoul/OU=Kiyoon" -out server.csr
openssl req -x509 -in server.csr -key server.key -out server.crt
mv server.crt ${CERTS_}certs/
mv server.csr server.key ${CERTS_}private/
rm -rf /etc/nginx/conf.d/default.conf
cp /tmp/nginx.conf /etc/nginx/sites-available/default

nginx -g 'daemon off;'