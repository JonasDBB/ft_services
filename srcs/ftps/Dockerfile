FROM alpine:latest

RUN apk update && \
	apk upgrade && \
	apk add openssl vsftpd jq curl

RUN mkdir -p /ftps && \
	adduser -D jonas -h /ftps && \
	echo "jonas:password" | chpasswd

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=NL/ST=Noord-Holland/O=Codam/CN=Jonas' -keyout /etc/ssl/private/ftpkey.key -out /etc/ssl/certs/ftpcert.crt

COPY srcs/vsfpd.conf	etc/vsftp/vsftp.conf

EXPOSE 20 21 10000

CMD vsftpd etc/vsftp/vsftp.conf