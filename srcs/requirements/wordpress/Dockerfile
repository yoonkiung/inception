FROM debian:buster

RUN apt-get update && \
    apt-get install -y \
        mariadb-client \
        php-fpm \
        php-curl \
        php-gd \
        php-mbstring \
        php-xml \
        wget && \
    rm -rf /var/lib/apt/lists/*

# Download and install WordPress
RUN wget -q https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm -f latest.tar.gz && \
    mkdir -p /var/www/html && \
    mv /wordpress/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/

# Configure php-fpm
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

CMD ["php-fpm7.3", "--nodaemonize"]