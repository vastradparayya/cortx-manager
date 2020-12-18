#!/bin/bash

echo Delete containers
docker rm --force csm-agent csm-web
echo Delete network
docker network rm csm-net
docker ps -a
netstat -tuln |grep :28