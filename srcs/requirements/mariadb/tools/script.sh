# #!/bin/bash

set -e
set -x

echo "in script"

service mysql start
#create user
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "show databases";
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}";
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "create user if not exists ${MYSQL_USER}@'%' identified by '${MYSQL_PASSWORD}'";
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO ${MYSQL_USER}@'%'";
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "flush privileges";
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "show databases";


# # change root name and password
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "set password for 'root'@'localhost' = password('${MYSQL_ROOT_PASSWORD}')";
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "flush privileges";
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES";

mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD proc
mysqladmin -uroot -p$MYSQL_ROOT_PASSWORD shutdown
echo "\ndaemon off;" >> /etc/mysql/mariadb.cnf
# sleep 100
# exec mysqld_safe
# service mysql start
# mysqladmin -u root password "$MYSQL_ROOT_PASSWORD" 
# mysql -u root -p"$DATABASE_ROOT_PASS" -e "UPDATE mysql.user SET Password=PASSWORD('$DATABASE_ROOT_PASS') WHERE User='root'" 
# mysql -u root -p"$DATABASE_ROOT_PASS" -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')" 
# mysql -u root -p"$DATABASE_ROOT_PASS" -e "DELETE FROM mysql.user WHERE User=''" 
# mysql -u root -p"$DATABASE_ROOT_PASS" -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'" 
# mysql -u root -p"$DATABASE_ROOT_PASS" -e "FLUSH PRIVILEGES"