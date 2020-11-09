#!/bin/zsh
minikube start --driver=virtualbox
minikube addons enable metallb
# minikube addons enable metrics-server
minikube addons enable dashboard
eval $(minikube docker-env)

# build services
docker build -t nginx srcs/nginx/
docker build -t mysql srcs/mysql/


# deploy services
kubectl apply -f srcs/

minikube dashboard