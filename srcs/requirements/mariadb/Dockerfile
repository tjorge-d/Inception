FROM debian:oldstable

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y

COPY ./tools/script.sh /

CMD ["./script.sh"]

