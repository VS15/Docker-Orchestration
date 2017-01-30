#“docker service create --name util \
#2     --network go-demo --mode global \
#3     alpine sleep 1000000000”

docker service create --name service-db --network service-net-1 mongo:3.2.10
docker service inspect --pretty service-db


docker service create --name solr-search -e DB=service-db --network service-net-1 --network proxy solr:latest 
#docker service create --name jenkins --network service-net-1 jenkins:latest
