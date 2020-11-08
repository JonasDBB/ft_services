FROM alpine:latest

RUN apk update && \
	apk upgrade  && \
	apk add nginx  && \
	openssh && \
	curl && \
	supervisor
# TO GET WORKING BASH IN IMAGE USE "kubectl exec -t -i <deployment-id> -- bash"
# RUN apk update && apk add bash

RUN adduser -D -g 'www' www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www & \
	mkdir -p /var/run/nginx
	
RUN ssh-keygen -A

COPY srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/nginx.crt /etc/ssl/services.crt
COPY srcs/nignx.key /etc/ssl/services.key

EXPOSE 80 443 22

CMD nginx -g 'daemon off;'