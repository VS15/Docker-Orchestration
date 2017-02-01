#Deploy Database service 
docker service create --name service-db --network service-net-1 mongo:3.2.10
docker service inspect --pretty service-db

#Deploy load balancing service
docker service create --name proxy -p 80:80 -p 443:443 -p 8080:8080 --network proxy -e MODE=swarm vfarcic/docker-flow-proxy
#Deploy solr search
docker service create --name solr-search -e DB=service-db --network service-net-1 --network proxy solr:latest 
docker service insprect --pretty solr-search
#Deploy rancherOS server
docker service create  --name rancheros -p 8080:8080 rancher/server
#docker service create --name jenkins --network service-net-1 jenkins:latest
#docker service create --name utility --network go-demo --mode global alpine sleep 1000000000

