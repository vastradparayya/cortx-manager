# CSM Microservices (build and run directly from sourcecode) docker environment.

## To install Docker (https://docs.docker.com/engine/install/centos/):
1. sudo yum install -y yum-utils
2. sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
3. sudo yum install -y docker-ce docker-ce-cli containerd.io

## To build container images:
1. Run ./pull.sh
2. Select and checkout branches what you intend to use
3. Put your branding files in ./branding/* folders if needed
4. Put stm.pem certificate for web-ui into ./extra folder
5. Run ./build.sh

## To run containers:
1. Fix *_template.* files in subfolders of csm-etc (csm_template.conf, database_template.yaml, database_template.json)
2. Modify configuration (cluster_id, password, other) or take it from your provisioned system folder /etc/csm.
   Template is for replacing <DOCKER_HOST_IP> with docker network address to allow agent to reach other host services.
3. Run ./run_cont.sh

## To stop containers:
8. Run ./down.sh

## Notes:
- ./bash_agent.sh will restart csm-agent container and enter interactive bash shell.
- ./bash_web.sh will restart csm-web container and enter interactive bash shell.
- Containers using csm-net network to reach each other.
- csm-agent container also binded to host network via bridge to access host network services.

[Jira ticket with Workbook Document linked](https://jts.seagate.com/browse/EOS-15701)