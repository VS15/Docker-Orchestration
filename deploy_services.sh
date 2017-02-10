#Deploy Database service 
#docker service create --name service-db --network service-net-1 mongo:3.2.10
#Deploy load balancing service
#docker service create --name proxy -p 80:80 -p 443:443 -p 8080:8080 --network proxy -e MODE=swarm vfarcic/docker-flow-proxy
echi "Create Jenkins Dir:" 
mkdir -p $PWD/docker/jenkins
#Deploy rancherOS server
echo "Deploying RancherOS Server:"
docker service create  --name rancheros -p 8081:8080 --network service-net-1 --network proxy  rancher/server
echo "Deploying Jenkins:"
docker service create --name jenkins -p 8082:8080 -p 50000:50000 --network service-net-1 --network proxy -e JENKINS_OPTS="--prefix=/jenkins" --mount "type=bind,source=$PWD/docker/jenkins,target=/var/jenkins_home" jenkins:latest
./display_summary.sh
