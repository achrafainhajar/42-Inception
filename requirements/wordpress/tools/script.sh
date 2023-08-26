#!/bin/bash
chown -R www-data:www-data /var/www/html/wordpress

mkdir -p /run/php
touch /run/php/php7.4-fpm.sock
chown -R www-data:www-data /run/php/
chmod 660 /run/php/php7.4-fpm.sock
cd /var/www/html/wordpress
wp core download --allow-root
wp core config --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root
wp core install --url=${DOMAIN_NAME} --title=achraf --admin_user=${WP_USER} --admin_password=${WP_PW} --admin_email=${WP_EMAIL} --allow-root
wp user create achraf achraf@gmail.com --role=author --user_pass=password --allow-root
wp search-replace 'localhost' 'aainhaja@42.fr' --allow-root
wp search-replace 'https://localhost' 'https://aainhaja@42.fr' --allow-root
exec $@