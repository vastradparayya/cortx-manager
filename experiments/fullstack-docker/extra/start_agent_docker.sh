#!/bin/bash

DOCKER_HOST_IP=$(ip r | awk '/^default[ ]/{print $3}')
echo $DOCKER_HOST_IP

cp /etc/csm/csm{_template,}.conf
sed -i -e "s|<DOCKER_HOST_IP>|${DOCKER_HOST_IP}|g" /etc/csm/csm.conf

cp /etc/csm/database{_template,}.yaml
sed -i -e "s|<DOCKER_HOST_IP>|${DOCKER_HOST_IP}|g" /etc/csm/database.yaml

cp /etc/cortx/ha/database{_template,}.json
sed -i -e "s|<DOCKER_HOST_IP>|${DOCKER_HOST_IP}|g" /etc/cortx/ha/database.json

python core/agent/csm_agent.py --debug

