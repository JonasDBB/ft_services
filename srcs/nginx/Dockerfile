FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN mkdir -p /run/nginx
# TO GET WORKING BASH IN IMAGE USE "kubectl exec -t -i <deployment-id> -- bash"
RUN apk update && apk add bash

# RUN adduser -D -g 'www' -h www
	
EXPOSE 80
EXPOSE 443

RUN mkdir -p /certs
COPY localhost.crt /certs
COPY localhost.key /certs
# COPY nginx.conf etc/nginx/

CMD nginx -g 'daemon off;'