#!/bin/bash

if [ -d "/var/lib/mysql/$DB_NAME" ]
then
  echo "The database \"$DB_NAME\" already exists."
else

chmod 777 etc/mysql/mariadb.conf.d/50-server.cnf
sed -i 's/127.0.0.1/0.0.0.0/' etc/mysql/mariadb.conf.d/50-server.cnf
sleep 2
chmod 644 etc/mysql/mariadb.conf.d/50-server.cnf

service mariadb start
sleep 3

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME ;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD' ;"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' ;"
mysql -e "FLUSH PRIVILEGES;"
sleep 3

service mariadb stop
fi

mysqld
