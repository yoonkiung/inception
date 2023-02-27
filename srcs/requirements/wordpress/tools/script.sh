#!/bin/bash

set -e
set -x

service mysql start
#create user
mysql -e "show databases";
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}";
mysql -e "create user if not exists ${MYSQL_USER}@'%' identified by '${MYSQL_PASSWORD}'";
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@'%'";
mysql -e "flush privileges";
mysql -e "show databases";


#change root name and password
# mysql -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'";
# mysql ${MYSQL_DATABASE} -u ${MYSQL_ROOT} -p${MYSQL_ROOT_PASSWORD}
# mysqladmin -u${MYSQL_ROOT} -p${MYSQL_ROOT_PASSWORD} shutdown

exec mysqld --console
php-fpm7.3 --nodaemonize
