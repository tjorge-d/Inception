FROM debian:oldstable

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y nginx

COPY ./tools/script.sh /

EXPOSE 443

ENTRYPOINT ["/script.sh"]

