#!/bin/bash
echo "Removing swarm services:"
docker service rm jenkins rancheros
echo "Removing swarm networks:"
docker network rm service-net-1 proxy
echo "Terminating docker machine VMs:"
if [`docker-machine ls|grep node |wc -l` -gt 0 ]
   then
   docker-machine rm -f swarm-node-1 swarm-node-2 swarm-node-3
fi
echo "Cleaning up local jenkins homedir"
rm -rf $PWD/docker/jenkins/*
