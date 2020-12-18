#!/bin/bash

docker rmi csm-agent-image
docker build -f ./Dockerfile_agent -t csm-agent-image .

docker rmi csm-web-image
mkdir -p branding/public branding/license branding/locales
docker build -f ./Dockerfile_web --build-arg BRAND_NAME=ldr -t csm-web-image .

