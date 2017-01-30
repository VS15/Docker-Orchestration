#!/bin/bash
echo "Creating network overlay for Docker swarm, deploying MongoDB and inspecting the service:"
docker network create --driver overlay service-net-1
docker service create --name service-db --network service-net-1 mongo:3.2.10
docker service inspect --pretty service-db

