#!/bin/bash
echo "Removing swarm services:"
docker service rm service-db proxy elastic solr-search
echo "Removing swarm networks:"
docker network rm service-net-1 proxy
echo "Terminating docker machine VMs:"
if [`docker-machine ls|grep node |wc -l` -gt 0 ]
   then
   docker-machine rm -f node-1 node-2 node-3
fi
