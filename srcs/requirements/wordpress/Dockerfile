FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm && \
    apt-get install -y php-mysql && \
    apt-get install -y wget && \
    apt-get install -y mariadb-server && \
    apt-get install -y mariadb-client

# Download and install WordPress
RUN wget https://wordpress.org/latest.tar.gz && \ 
    tar -xzf latest.tar.gz && \
    rm -f latest.tar.gz && \
    mkdir -p /var/www/html/wordpress && \
    mv /wordpress/* /var/www/html/wordpress && \
    chown -R www-data:www-data /var/www/html/

# Configure php-fpm
COPY ./conf /etc/php/7.3/fpm/

# Script
COPY ./tools/script.sh /
RUN chmod 755 script.sh

RUN mkdir /run/php

EXPOSE 9000

# CMD ["php-fpm7.3", "--nodaemonize"]
CMD ["sh", "script.sh"]