#!/bin/zsh
minikube start --driver=virtualbox
minikube addons enable metallb
minikube addons enable dashboard

eval $(minikube docker-env)

# build services
docker build -t nginx srcs/nginx/

# deploy services
kubectl apply -f srcs/

minikube dashboard