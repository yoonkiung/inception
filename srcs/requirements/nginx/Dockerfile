FROM debian:buster

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt install nginx -y && \
    apt-get install openssl -y

COPY ./nginx.conf /tmp
COPY ./tools/script.sh /
RUN chmod 755 /script.sh

CMD ["sh", "/script.sh"]
EXPOSE 443
