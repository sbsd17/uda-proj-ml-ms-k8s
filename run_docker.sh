#!/usr/bin/env bash

docker build --tag=predict-app .

docker image ls

docker run -p 8000:80 predict-app
