#!/bin/zsh
minikube start --driver=virtualbox --disk-size=5GB --extra-config=kubelet.authentication-token-webhook=true
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard
eval $(minikube docker-env)

# creating secret
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# applying metallb yaml
kubectl apply -f srcs/metallb.yaml

# creating serviceaccount
kubectl create serviceaccount jonas
kubectl apply -f srcs/serviceaccount.yaml

# build images and services
# nginx
docker build -t nginx srcs/nginx/
kubectl apply -f srcs/nginx.yaml

# mysql
docker build -t mysql srcs/mysql/
kubectl apply -f srcs/mysql.yaml

# wordperss . Yes. wordperss
docker build -t wordpress srcs/wordpress/
kubectl apply -f srcs/wordpress.yaml

# phpmyadmin
docker build -t phpmyadmin srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin.yaml

# ftps
docker build -t ftps srcs/ftps/
kubectl apply -f srcs/ftps.yaml

# influxdb
docker build -t influxdb srcs/influxdb/
kubectl apply -f srcs/influxdb.yaml

# telegraf
docker build -t telegraf srcs/telegraf/
kubectl apply -f srcs/telegraf.yaml

# grafana
docker build -t grafana srcs/grafana/
kubectl apply -f srcs/grafana.yaml

# running dashboard (pray to the kubergods it works)
minikube dashboard
