Automated Orchestration with Docker Swarm v1.13, Jenkins 2.32 and RancherOS server:
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Prerequisites for this deployment is Docker Platform v1.12+: https://www.docker.com/products/docker
The main purpose of this project is to automatically create a highly available and easy scalable Jenkins Build farm.
1. Once you run the ./intiate_swarm_cluster.sh script it will automatically spin up 3 virtual machines by using docker-machine.
2. On the second step it will create a docker swarm cluster with 1 leader and 2 workers.  
3. By using docker-network it will create two software-defined networks: proxy and service-net-1
4. Docker-service will create 2 services running within the docker-swarm cluster: Jenkins and RancherOS. These services are highly available. If one service crashes the swarm will automatically spin a new copy of it. All services are attached to both SDNs and user traffic is routed to them disregarding the node processing the request, meaning that services are technically load-balanced.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
How to section:
·      To auto-deploy and configure the cluster execute the following: ./intiate_swarm_cluster.sh
·      You will need to configure jenkins on the initial startup and install Jenkins Self-Organizing Swarm Plug-in Modules plugin in Plugin manager and restart Jenkins (please create admin:admin user). Navigate to this link: http://192.168.99.102:8082/jenkins/
·      Once Jenkins has been configured, please execute the jenkins-slaves script to deploy docker container based slaves with auto-discovery: ./deploy_jenkins_slave_service.sh
·      Swarm cluster summary will be printed to the terminal once the deployment is complete, including the Jenkins initiation password
·      To access RancherOS server console navigate to this link: http://192.168.99.102:8081/
·      To scale the service you can execute the following command: eval $(docker-machine env swarm-node-1) && docker service scale service=number of instances
·      To terminate the swarm cluster execute the following: ./terminate_swarm_cluster.sh
