#!/bin/bash 
echo "************************"
echo "These are your Virtual Machines:"
docker-machine ls
eval $(docker-machine env swarm-node-1)
echo "************************"
echo "This is you swarm cluster:"
docker node ls
echo "************************"
echo "These are your networks:"
docker network ls| grep overlay| grep -v ingress
echo "************************"
echo "These are your running services, listening on both networks:"
docker service ls
echo "localhost port for RancherOS: 8081"
echo "localhost port for Jenkins: 8082/jenkins"
echo "Admin password for Jenkins:" `cat $PWD/docker/jenkins/secrets/initialAdminPassword`
echo "************************"
