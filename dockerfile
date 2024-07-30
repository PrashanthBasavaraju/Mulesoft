# Use an OpenJDK 8 image as a parent image
FROM adoptopenjdk/openjdk8

LABEL maintainer="bibekgorain"

ENV MULE_HOME=/opt/mule
ENV MULE_VERSION=4.4.0

# Download and install Mule runtime
RUN set -x \
    && cd /opt \
    && curl -o mule.zip https://repository-master.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone/${MULE_VERSION}/mule-standalone-${MULE_VERSION}.zip \
    && unzip mule.zip \
    && mv mule-standalone-$MULE_VERSION mule \
    && rm mule.zip

WORKDIR $MULE_HOME

# Define volumes for logs, configuration, apps, and domains
VOLUME ["$MULE_HOME/logs", "$MULE_HOME/conf", "$MULE_HOME/apps", "$MULE_HOME/domains"]

# Expose the default Mule HTTP port
EXPOSE 8081

# Set the entry point for the container
ENTRYPOINT ["./bin/mule"]
