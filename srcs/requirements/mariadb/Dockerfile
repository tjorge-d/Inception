FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y

COPY ./tools/script.sh /

ENTRYPOINT ["/script.sh"]
