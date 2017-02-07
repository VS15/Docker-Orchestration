#!/bin/bash
#Verify nothing is running:

if [`docker-machine ls|grep swarm-node |wc -l` -gt 0 ]
   then    
   docker-machine rm -f swarm-node-1 swarm-node-2 swarm-node-3 
fi
#Deploy virtual machines - virtualbox provider

for i in 1 2 3 
    do docker-machine create -d virtualbox swarm-node-$i
done
#Capture the environment for a swarm master
eval $(docker-machine env swarm-node-1)

#Initiate docker swarm leader
docker swarm init --advertise-addr $(docker-machine ip swarm-node-1)

#Capture swarm TOKEN 
TOKEN=$(docker swarm join-token -q worker)

echo "Swarm Leader Token:"
echo $TOKEN

#Connect secondary swarm-nodes to the swarm cluster 
for i in 2 3
    do eval $(docker-machine env swarm-node-$i) 
    docker swarm join --token $TOKEN --advertise-addr $(docker-machine ip swarm-node-$i) $(docker-machine ip swarm-node-1):2377
done
eval $(docker-machine env swarm-node-1)

#List swar cluster members
echo "Docker Swarm cluster:"
docker swarm-node ls

./create_swarm_networks.sh
