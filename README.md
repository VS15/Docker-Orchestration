# Docker-Orchestration with Docker Swarm v 1.13, Jenkins and RancherOS
Prerequisites for running this deployment is Docker Platform v1.12+: i.e. https://www.docker.com/products/docker
----------------------------------------------------------------------------------------------------------------
READ THIS FIRST
1. The processes is fully automated and deploys the implementation, defined on the architecture schema.
2. The set of shell scripts is invoked in this process to spin the highly available cluster based on the docker-machine, docker swarm, docker network.
3. All services are scalable, highly available and load balanced.
4. To auto-deploy and configure the cluster execute the following: ./intiate_swarm_cluster.sh
5. You will need to configure jenkins on the initial startup and install jenkins Self-Organizing Swarm Plug-in Modules plugin in Plugin manager and restart Jenkins (please create admin:admin user). Navigate to this link: http://192.168.99.102:8082/jenkins/
6. Once Jenkins has been configured, please execute the jenkins-slaves script to deploy docker container based slaves with auto-discovery: ./deploy_jenkins_slave_service.sh
7. Any of the services can be usually scaled and is highly available if one instance dies it will be immediately handled by Docker Swarm
8. Swarm cluster summary will be printed to the terminal once the deployment is complete, including the Jenkins initiation password
9. To access RancherOS server console navigate to this link: http://192.168.99.102:8081/
10.To scale the service you can execute the following command: eval $(docker-machine env swarm-node-1) && docker service scale <service name>=<number of instances> 
11.To terminate the swarm cluster execute the following: ./terminate_swarm_cluster.sh
