FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
        mariadb-server \
        mariadb-client

COPY ./tools/script.sh /tmp/script.sh

EXPOSE 3306

CMD ["sh", "/tmp/script.sh"]