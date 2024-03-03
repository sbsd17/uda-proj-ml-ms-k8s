#!/usr/bin/env bash

USERNAME=sseukapd
dockerpath=$USERNAME/predict-app
echo "Docker ID and Image: $dockerpath"

kubectl create deploy predict-app --image=$dockerpath:v1.0.0

kubectl get pods

kubectl port-forward $(kubectl get pods -o name | grep 'pod/predict-app') --address 0.0.0.0 8000:80

