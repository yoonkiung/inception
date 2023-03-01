FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
        mariadb-server \
        mariadb-client \
        procps

COPY ./tools/script.sh /tmp/script.sh
COPY ./tools/50-server.conf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod 755 /tmp/script.sh

EXPOSE 3306

CMD ["sh", "/tmp/script.sh"]