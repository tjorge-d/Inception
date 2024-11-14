FROM debian:bullseye

WORKDIR /var/www/html

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y php-fpm php-mysql curl netcat

COPY ./tools/script.sh /
EXPOSE 9000
ENTRYPOINT ["/script.sh"]
