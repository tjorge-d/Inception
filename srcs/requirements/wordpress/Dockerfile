FROM debian:oldstable

RUN apt update -y && \
    apt upgrade -y && \
    apt install php-fpm php-mysql -y

COPY ./tools/script.sh /

CMD ["./script.sh"]
