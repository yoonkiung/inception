FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
        php-fpm \
        wget

# Download and install WordPress
# RUN wget -q https://wordpress.org/latest.tar.gz && \
#     tar -xzf latest.tar.gz && \
#     rm -f latest.tar.gz && \
#     mkdir -p /var/www/html && \
#     mv /wordpress/* /var/www/html/ && \
#     chown -R www-data:www-data /var/www/html/

# Configure php-fpm

RUN mkdir -p /var/www/html
COPY ./conf /etc/php/7.3/fpm/

RUN mkdir /run/php

EXPOSE 9000

CMD ["php-fpm7.3", "--nodaemonize"]