#!/bin/bash

echo Delete containers
docker rm --force csm-web
echo Run containers
docker run -it --name csm-web -p 28100:28100 --network=csm-net csm-web-image /bin/bash
netstat -tuln |grep :28
