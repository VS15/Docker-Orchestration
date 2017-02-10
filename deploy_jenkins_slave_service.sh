#!/bin/bash
docker service create --name jenkins-agent -e "SWARM_MASTER_URL=http://$(docker-machine ip swarm-node-1):8082/jenkins" \
-e "SWARM_JENKINS_USER=admin" \
-e "SWARM_JENKINS_PASSWORD=admin" \
blacklabelops/jenkins-swarm
#echo "Scaling jenkins slaves to 5 nodes"
#sleep 10
#scale to 5 build slaves 
#eval $(docker-machine env swarm-node-1) && docker service scale jenkins-agent=5
