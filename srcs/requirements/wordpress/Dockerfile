FROM debian:oldstable

WORKDIR /var/www/html

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y php-fpm php-mysql curl netcat

COPY ./tools/script.sh /

EXPOSE 9000

ENTRYPOINT ["/script.sh"]
