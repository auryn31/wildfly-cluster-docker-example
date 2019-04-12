FROM jboss/wildfly

ADD helloworld.war /opt/jboss/wildfly/standalone/deployments/

ARG WILDFLY_NAME

ENV WILDFLY_NAME=${WILDFLY_NAME}


ENTRYPOINT /opt/jboss/wildfly/bin/standalone.sh -b=0.0.0.0 -bmanagement=0.0.0.0 -Djboss.server.default.config=standalone-full-ha.xml -Djboss.node.name=${WILDFLY_NAME}