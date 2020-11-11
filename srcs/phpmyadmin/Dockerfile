FROM alpine:latest

RUN apk update && \
	apk upgrade && \
	apk add nginx \
			mysql-client \
			php7 \
			php7-json \
			php7-fpm \
			php7-session \
			php7-mysqli \
			php7-mbstring \
			php7-phar

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www && \
	mkdir -p /var/run/nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN	tar -zxvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www
RUN	rm phpMyAdmin-5.0.1-english.tar.gz

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/config.inc.php /www/
COPY srcs/startup.sh ./
RUN chmod +x /startup.sh

EXPOSE 5000

# CMD ./startup.sh