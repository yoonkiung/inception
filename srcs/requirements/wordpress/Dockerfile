FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install php-fpm -y && \
    apt-get install wget -y && \
    apt-get install tar -y 

# Download and install WordPress
# RUN wget https://wordpress.org/latest.tar.gz && \ 
#     tar -xzf latest.tar.gz && \
#     rm -f latest.tar.gz && \
#     mkdir -p /var/www/html/wordpress && \
#     mv /wordpress/* /var/www/html/wordpress && \
#     chown -R www-data:www-data /var/www/html/

# Configure php-fpm

COPY ./conf /etc/php/7.3/fpm/
COPY ./tools/script.sh /

RUN mkdir /run/php

EXPOSE 9000

CMD ["chmod", "777", "script.sh"]
CMD ["sh", "script.sh"]