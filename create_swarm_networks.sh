#!/bin/bash
echo "Creating network overlay for Docker swarm:"
docker network create --driver overlay service-net-1
echo "Creating proxy network"
docker network create --driver overlay proxy
echo "Listing all overlay networks"
docker network ls -f "driver=overlay"
./deploy_services.sh
