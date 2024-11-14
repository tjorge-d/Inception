#!/bin/bash
DOMAIN="$USER$DOMAIN_SUFFIX"

# Generating a self signing certificate and  a private key with OpenSSL #
echo "Generating key and certificate (OpenSSL) ..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/$DOMAIN.key \
-out /etc/ssl/certs/$DOMAIN.crt \
-subj "/C=PT/L=Lisbon/O=42Lisboa/OU=student/CN=$DOMAIN" > /dev/null 2>&1

# Configuring nginx #
sed -i "s/domain_here/$DOMAIN/g" my_nginx.conf
mv my_nginx.conf /etc/nginx/conf.d/$DOMAIN.conf
mkdir -p /run/nginx

echo "Nginx is ready!"
nginx -g "daemon off;"
