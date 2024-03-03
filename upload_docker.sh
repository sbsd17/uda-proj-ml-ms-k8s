#!/usr/bin/env bash

# This file tags and uploads an image to Docker Hub
# Assumes that an image is built via `run_docker.sh`

USERNAME=sseukapd
dockerpath=$USERNAME/predict-app
echo "Docker ID and Image: $dockerpath"

# Authenticate
read -s -p "Enter Docker Hub access token: " ACCESS_TOKEN
echo "$ACCESS_TOKEN" | docker login -u $USERNAME --password-stdin
unset ACCESS_TOKEN

# Tag image
docker tag predict-app $dockerpath:v1.0.0

# Push
docker push $dockerpath:v1.0.0
