#!/bin/bash

set -e
set -x

service mysql start

#create user
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}";
mysql -e "create user if not exists ${MYSQL_USER}@'%' identified by '${MYSQL_PASSWORD}'";
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@'%'";
mysql -e "flush privileges";

#change root name and password
mysql -e "update user set user='${MYSQL_ROOT} where user='root'";
mysql -e "ALTER USER '${MYSQL_ROOT}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'";
mysql -e "flush privileges";
