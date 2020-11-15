FROM alpine:latest

RUN apk update && \
	apk upgrade && \
	apk add libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz && \
	tar -zxvf grafana-7.2.0.linux-amd64.tar.gz && \
	rm grafana-7.2.0.linux-amd64.tar.gz

COPY srcs/grafana.db /grafana-7.2.0/data/

EXPOSE 3000

# CMD tail -f /dev/null
CMD cd grafana-7.2.0 && ./bin/grafana-server