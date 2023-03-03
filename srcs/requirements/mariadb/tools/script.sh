# #!/bin/bash

set -e
set -x

service mysql start;

#create user
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}";
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'";
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%'";
mysql -e "FLUSH PRIVILEGES";


# # change root name and password
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES";

mysql $MYSQL_DATABASE -uroot -p$MYSQL_ROOT_PASSWORD
mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown
exec mysqld_safe
