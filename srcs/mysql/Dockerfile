FROM alpine:latest

RUN apk update && \
	apk upgrade && \
	apk add mysql mysql-client

RUN addgroup mysql mysql

COPY srcs/my.cnf /etc/my.cnf
COPY srcs/startup.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh

VOLUME /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["/bin/sh", "/tmp/startup.sh"]
