FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y nginx openssl

COPY ./conf/my_nginx.conf /
COPY ./tools/script.sh /

ENTRYPOINT ["/script.sh"]

