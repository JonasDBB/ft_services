#!/bin/zsh
minikube start --driver=virtualbox --disk-size=5GB
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard
eval $(minikube docker-env)

kubectl apply -f srcs/metallb.yaml

# build services
docker build -t nginx srcs/nginx/
kubectl apply -f srcs/nginx.yaml

docker build -t mysql srcs/mysql/
kubectl apply -f srcs/mysql.yaml

docker build -t wordpress srcs/wordpress/
kubectl apply -f srcs/wordpress.yaml

docker build -t phpmyadmin srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin.yaml

minikube dashboard