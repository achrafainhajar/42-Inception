FROM debian:bullseye
RUN apt-get update && apt-get install -y php7.4 \
php7.4-fpm php7.4-mysql mariadb-client \
nginx curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
COPY ./tools/script.sh ./script.sh
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN chmod +x script.sh
RUN mkdir /run/php/
ENTRYPOINT ["sh", "script.sh"]
CMD ["php-fpm7.4", "-R", "-F"]