#!/bin/bash

#Verify nothing is running:

docker-machine rm -f node-1 node-2 node-3 

#Deploy virtual machines - virtualbox provider
for i in 1 2 3; do docker-machine create -d virtualbox node-$i; done

#Capture the environment for a swarm master
eval $(docker-machine env node-1)

#Initiate docker swarm
docker swarm init  --advertise-addr $(docker-machine ip node-1)

#Capture swarm TOKEN 

TOKEN=$(docker swarm join-token -q worker)
sleep 2

for i in 2 3; do eval $(docker-machine env node-$i) docker swarm join  --token $TOKEN --advertise-addr $(docker-machine ip node-$i) $(docker-machine ip node-1):2377;
done

eval $(docker-machine env node-1)

docker node ls



