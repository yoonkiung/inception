FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y php7.3-fpm \
        php-mysql \
        php-cli \
        curl \
        sudo \
        mariadb-client \
        tar


# Download and install WordPress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    sudo mv wp-cli.phar /usr/local/bin/wp

# Configure php-fpm
COPY ./conf /etc/php/7.3/fpm/
COPY ./tools/script.sh /
RUN chmod 755 script.sh

RUN mkdir /run/php

EXPOSE 9000

CMD ["sh", "script.sh"]
