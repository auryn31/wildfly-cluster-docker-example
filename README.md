# wildfly-docker-multicast-test
This is a short example of Wildfly running in two docker containern to create a cluster.

## Dockerfile
- `-Djboss.node.name=${WILDFLY_NAME}`
    - The wildflyname is specified with that there are no name conflicts in the cluster.
- `-Djava.net.preferIPv4Stack=true`
    - infinispan has to use the ipv4 stack to comunicate over the *230.0.0.4* address (default) 
- `-Djgroups.bind_addr=$(hostname -i)` 
    - **important** to bind jgoup to the local ip of the container
    - if you forget this parameter, jgroup use 127.0.0.1 --> this will not work if you are trying to create a cluster over different machines
- `-Djboss.messaging.cluster.password=${CLUSTER_PW}`
    - you have to change the standard passwort, if not, jboss will throw an exception and you cannot use the distributed cache

## docker-compose.yaml
The docker-compose.yaml file will provide the arguments for the container and will build the image with the current dockerfile. It also define the network, in which the two wildflys are operating.