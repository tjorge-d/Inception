FROM debian:oldstable

RUN apt update -y && \
    apt upgrade -y
    #apt install -y nginx

COPY ./tools/script.sh /

CMD ["./script.sh"]

