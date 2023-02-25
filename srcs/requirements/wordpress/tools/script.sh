echo "download worpress"

wget https://wordpress.org/latest.tar.gz && \ 
tar -xzf latest.tar.gz && \
rm -f latest.tar.gz && \
mv /wordpress/* /var/www/html/ && \
chown -R www-data:www-data /var/www/html/

echo "wordpress download complete"

php-fpm7.3 --nodaemonize