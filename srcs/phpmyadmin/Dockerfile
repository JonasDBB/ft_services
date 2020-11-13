FROM alpine:latest

RUN apk update && \
	apk upgrade && \
	apk add php7 \
	php7-fpm \
	php7-opcache \
	php7-gd \
	php7-mysqli \
	php7-zlib \
	php7-curl \
	php7-mbstring \
	php7-json \
	php7-session \
	php7-zip \
	nginx

RUN mkdir -p /www && \
	mkdir -p /www/phpmyadmin && \
	mkdir -p /www/tmp && \
	mkdir -p /www/phpmyadmin/tmp && \
	mkdir -p /run/nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN	tar -zxvf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /www
RUN	rm phpMyAdmin-5.0.1-english.tar.gz

RUN adduser -D -g 'www' www && \
	chown -R www:www /www && \
	chown -R www:www /www/tmp && \
	chown -R www:www /www/phpmyadmin/tmp

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/config.inc.php /www/
COPY srcs/startup.sh ./
RUN chmod +x /startup.sh

EXPOSE 5000

CMD ./startup.sh