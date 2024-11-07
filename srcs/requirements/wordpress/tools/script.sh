#!/bin/bash

# Removing possible previous content #
rm -rf *

# Installing Wordpress Command Line Interface #
echo "Installing Wordpress Command Line Interface (WP-CLI)..."
curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# Waiting for MariaDB configuration #
while ! nc -z mariadb 3306 ; do
  echo "Waiting for MariaDB configuration..."
  sleep 2
done

# Downloading and Configuring Wordpress #
echo "Downloading and Configuring Wordpress ..."
wp core download --allow-root --quiet
wp config create --allow-root \
--dbname=$NETWORK \
--dbuser=$USER \
--dbpass=$DB_USER_PASSWORD \
--dbhost=mariadb

# Installing Wordpress #
wp core install --skip-email --allow-root \
--url=$USER.42.fr \
--title=$WP_TITLE \
--admin_user=$WP_ADMIN_USER \
--admin_password=$WP_ADMIN_PASSWORD \
--admin_email=$WP_ADMIN_EMAIL

# Creating an user (author) #
wp user create --role=author --allow-root \
$USER $USER_EMAIL \
--user_pass=$WP_USER_PASSWORD

# Initializing PHP FastCGI Process Manager #
mkdir /run/php
php-fpm7.4 -FR
