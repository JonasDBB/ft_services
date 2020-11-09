FROM alpine:latest

RUN apk update && \
	apk upgrade && \
	apk add nginx openssh

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www & \
	mkdir -p /var/run/nginx

RUN	adduser -D jonas
RUN	echo "jonas:password"|chpasswd
RUN ssh-keygen -A

COPY srcs/nginx.conf	/etc/nginx/conf.d/default.conf
COPY srcs/nginx.crt		/etc/ssl/nginx.crt
COPY srcs/nginx.key		/etc/ssl/nginx.key
COPY srcs/sshd_config	/etc/ssh/sshd_config
COPY srcs/index.html	/www/index.html
COPY srcs/startup.sh	./

RUN chmod +x ./startup.sh

EXPOSE 80 443 22

CMD ./startup.sh
# CMD nginx -g 'daemon off;'