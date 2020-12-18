#!/bin/bash

echo Delete containers
docker rm --force csm-agent csm-web
echo Delete network
docker network rm csm-net
echo Create network
docker network create csm-net
echo Run containers
docker run -d --name csm-agent -p 28101:28101 -v $PWD/csm-etc/csm:/etc/csm -v $PWD/csm-etc/cortx:/etc/cortx csm-agent-image
docker network connect csm-net csm-agent
docker run -d --name csm-web -p 28100:28100 --network=csm-net csm-web-image
netstat -tuln |grep :28

