#!/bin/bash
docker service create --name jenkins-agent -e "SWARM_MASTER_URL=http://$(docker-machine ip swarm-node-1):8082/jenkins" \
-e "SWARM_JENKINS_USER=admin" \
-e "SWARM_JENKINS_PASSWORD=admin" \
blacklabelops/jenkins-swarm


