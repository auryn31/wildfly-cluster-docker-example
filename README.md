# Wildfly Docker Multicast
This is a short example of Wildfly running in two docker container to create a cluster. The container are managed by a compose file.

To start the example you have to type:

`docker-compose up`

Docker will pull the current wildfly image and start two docker container and create a cluster with both. You can see that the cluster is working when the following part is shown in the log:

`INFO  [org.infinispan.CLUSTER] (MSC service thread 1-4) ISPN000094: Received new cluster view for channel ejb: [wildfly_2_test|1] (2) [wildfly_2_test, wildfly_1_test]`

You can reach the example war under: 
- http://127.0.0.1:8080/helloworld/HelloWorld
- http://127.0.0.1:8080/helloworld/HelloWorld

## Requirements
- docker
- docker-compose

## Dockerfile
- `-Djboss.node.name=${WILDFLY_NAME}`
    - The wildfly name is specified with that there are no name conflicts in the cluster.
- `-Djava.net.preferIPv4Stack=true`
    - infinispan has to use the ipv4 stack to comunicate over the *230.0.0.4* address (default) 
- `-Djgroups.bind_addr=$(hostname -i)` 
    - **important** to bind jgoup to the local IP of the container
    - if you forget this parameter, jgroup use 127.0.0.1 --> this will not work if you are trying to create a cluster over different machines
- `-Djboss.messaging.cluster.password=${CLUSTER_PW}`
    - you have to change the standard password, if not, JBoss will throw an exception and you cannot use the distributed cache

## docker-compose.yaml
The docker-compose.yaml file will provide the arguments for the container and will build the image with the current dockerfile. It also defines the network, in which the two wildly are operating.