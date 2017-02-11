# Automated Orchestration with Docker Swarm v1.13, Jenkins 2.32 and RancherOS server
----------------------------------------------------------------------------------------------------------------
Prerequisites for running this deployment is Docker Platform v1.12+: https://www.docker.com/products/docker
- The processes is fully automated and deploys the implementation, defined on the architecture schema.
- The set of shell scripts is invoked in this process to spin the highly available cluster based on the docker-machine, docker swarm, docker network.
- All services are scalable, highly available and load balanced.
- To auto-deploy and configure the cluster execute the following: ./intiate_swarm_cluster.sh
- You will need to configure jenkins on the initial startup and install jenkins Self-Organizing Swarm Plug-in Modules plugin in Plugin manager and restart Jenkins (please create admin:admin user). Navigate to this link: http://192.168.99.102:8082/jenkins/
- Once Jenkins has been configured, please execute the jenkins-slaves script to deploy docker container based slaves with auto-discovery: ./deploy_jenkins_slave_service.sh
- Any of the services can be usually scaled and is highly available if one instance dies it will be immediately handled by Docker Swarm
- Swarm cluster summary will be printed to the terminal once the deployment is complete, including the Jenkins initiation password
- To access RancherOS server console navigate to this link: http://192.168.99.102:8081/
- To scale the service you can execute the following command: eval $(docker-machine env swarm-node-1) && docker service scale service=number of instances
- To terminate the swarm cluster execute the following: ./terminate_swarm_cluster.sh
