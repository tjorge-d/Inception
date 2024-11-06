#!/bin/bash

# Removing possible previous content #
cd /var/www/html
rm -rf *

# Installing Wordpress Command Line Interface #
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root

# Settings Config  #
sed -i -r "s/database_name_here/$NETWORK/1" wp-config-sample.php
sed -i -r "s/username_here/$USER/1" wp-config-sample.php
sed -i -r "s/password_here/$DB_PASSWORD/1" wp-config-sample.php
sed -i -r "s/localhost/mariadb/1" wp-config-sample.php
mv wp-config-sample.php wp-config.php 


# Installing Wordpress #
sleep 20
echo oi
wp core install --url=$USER.42.fr/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root


tail -f /dev/null
