#!/bin/bash

set -e
set -x

if [ ! -e "/var/www/html/index.php" ]; then

	chown -R www-data:www-data /var/www/
	chown -R www-data:www-data /var/www/html
	cd /var/www/html


	sudo -u	www-data sh -c "wp core download --locale=$WORDPRESS_LOCAL"
	sudo -u	www-data sh -c "wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_NAME"
	sudo -u	www-data sh -c "wp core install --url=$WORDPRESS_URL --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email"
	sudo -u	www-data sh -c "wp user create $WORDPRESS_USER_NAME $WORDPRESS_USER_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASSWORD"
	sudo -u	www-data sh -c "wp plugin update --all"
fi

php-fpm7.3 --nodaemonize
