FROM debian:oldstable

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y php-fpm php-mysql curl

COPY ./tools/script.sh /

CMD ["./script.sh"]
