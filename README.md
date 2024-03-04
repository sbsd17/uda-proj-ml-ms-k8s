[![CircleCI](https://dl.circleci.com/status-badge/img/gh/sbsd17/uda-proj-ml-ms-k8s/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/sbsd17/uda-proj-ml-ms-k8s/tree/main)

## Project Overview

Operationalize a Machine Learning Microservice API. 

Use a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing).

### Project Tasks

> The project goal is to operationalize a working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications.


* Test project code using linting
* Complete Dockerfile to containerize this application
* Deploy containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that the code has been tested
<br>
<br>
<br>

## Setup and Run

> You should have Python 3.7 available on your host.<br>
> Here is a [tutorial to get it installed on Amazon Linux](https://tecadmin.net/install-python-3-7-amazon-linux/)<br>
>Check the Python path using `which python3`

* Run `python -m venv .devops` to create a virtualenv
* Run `source .devops/bin/activate` to activate the virtualenv
* Run `make install` to install the necessary dependencies
>You should also install other libraries and tools used for the project. Checkout the tutorials linked or official pages for the libraries and tools
>- [hadolint](https://devopscube.com/lint-dockerfiles-using-hadolint/)<br>
>- [Docker](https://www.cyberciti.biz/faq/how-to-install-docker-on-amazon-linux-2/)
>- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
>- [minikube](https://minikube.sigs.k8s.io/docs/start/)

* Run `make lint` to check the Dockerfile and app.py for possible issues and errors using hadolint and pylint

### Running `app.py`
>Verify the tools and libraries are installed
#### 1 - Standalone:  `python app.py`
#### 2 - Run in Docker:  `./run_docker.sh`
* Run `sudo systemctl status docker.service` to verify docker is up and running
* Run `./run_docker.sh` to build and start the app
* Run `./make_prediction.sh` to make a prdiction
#### 3 - Run in Kubernetes:  `./run_kubernetes.sh`
* Run `kubectl version --client` to verify kubectl is installed
* Run `./run_docker.sh` if you haven't built the image
* Run `./upload_docker.sh` to upload the image to your docker repository. You might be required to provide an access token for authentication
* Run `minikube start`
* Run `minikube status` to check the status of the cluster
* Run `./run_kubernetes.sh` to deploy the app and port forward. In case you get an error when trying to port forward (the container might still be in the process of being created), wait a few minites and re-run the script
* Run `./make_prediction.sh` to make a prdiction
