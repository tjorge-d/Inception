#!/bin/bash

chmod 777 etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/127.0.0.1/0.0.0.0/' etc/mysql/mariadb.conf.d/50-server.cnf
sleep 3
chmod 644 etc/mysql/mariadb.conf.d/50-server.cnf
sleep 3

service mariadb start
sleep 3

mysql -e "CREATE DATABASE IF NOT EXISTS $NETWORK ;"
mysql -e "CREATE USER IF NOT EXISTS '$USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD' ;"
mysql -e "GRANT ALL PRIVILEGES ON $NETWORK.* TO '$USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"
sleep 3

service mariadb stop
sleep 3

mysqld_safe --bind-address=0.0.0.0
