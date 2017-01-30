#!/bin/bash
#Verify nothing is running:

if [`docker-machine ls|grep node |wc -l` -gt 0 ]
   then    
   docker-machine rm -f node-1 node-2 node-3 
fi
#Deploy virtual machines - virtualbox provider

for i in 1 2 3 
    do docker-machine create -d virtualbox node-$i
done
#Capture the environment for a swarm master
eval $(docker-machine env node-1)

#Initiate docker swarm leader
docker swarm init --advertise-addr $(docker-machine ip node-1)

#Capture swarm TOKEN 
TOKEN=$(docker swarm join-token -q worker)

echo "Swarm Leader Token:"
echo $TOKEN

#Connect secondary nodes to the swarm cluster 
for i in 2 3
    do eval $(docker-machine env node-$i) 
    docker swarm join --token $TOKEN --advertise-addr $(docker-machine ip node-$i) $(docker-machine ip node-1):2377
done
eval $(docker-machine env node-1)

#List swar cluster members
echo "Docker Swarm cluster:"
docker node ls

./create_swarm_networks.sh
