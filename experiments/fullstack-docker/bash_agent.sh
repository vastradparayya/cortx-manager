#!/bin/bash

docker run -dit --name csm-agent -p 28101:28101 -v $PWD/csm-etc/csm:/etc/csm -v $PWD/csm-etc/cortx:/etc/cortx csm-agent-image /bin/bash
echo add network
docker network connect csm-net csm-agent
docker attach csm-agent

