#!/bin/zsh
minikube start --driver=virtualbox
minikube addons enable metallb
minikube addons enable dashboard
eval $(minikube docker-env)

kubectl apply -f srcs/metallb.yaml

# build services
docker build -t nginx srcs/nginx/
docker build -t mysql srcs/mysql/
docker build -t wordpress srcs/wordpress/

# deploy services
kubectl apply -f srcs/nginx.yaml
kubectl apply -f srcs/mysql.yaml
kubectl apply -f srcs/wordpress.yaml

minikube dashboard