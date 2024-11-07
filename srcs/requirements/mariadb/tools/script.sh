#!/bin/bash

# Starting and configuring Mariadb #
echo "Configuring MariaDB ..."
service mariadb start > /dev/null
mysql -e "CREATE DATABASE IF NOT EXISTS $NETWORK ;"
mysql -e "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD' ;"
mysql -e "GRANT ALL PRIVILEGES ON $NETWORK.* TO '$USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# Reseting Mariadb so the changes take effect #
sleep 3
service mariadb stop > /dev/null
exec mysqld_safe --bind-address=0.0.0.0
