FROM alpine:latest

RUN apk update && \
	apk upgrade

RUN	wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_static_linux_amd64.tar.gz && \
	tar xf telegraf-1.15.3_static_linux_amd64.tar.gz && \
	rm telegraf-1.15.3_static_linux_amd64.tar.gz
 
RUN mkdir /etc/telegraf

COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8125

# CMD tail -f /dev/null
CMD telegraf-1.15.3/usr/bin/telegraf