#!/bin/zsh
minikube start --driver=virtualbox --disk-size=5GB
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard
eval $(minikube docker-env)

# applying metallb yaml
kubectl apply -f srcs/metallb.yaml

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

# running dashboard (pray to the kubergods it works)
minikube dashboard
