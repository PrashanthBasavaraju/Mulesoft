# Use an official base image with apt-get support
FROM openjdk:17-jdk-slim AS build

# Install required tools
RUN apt-get update && \
    apt-get install -y unzip curl && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/mule

# Download and install Mule runtime
RUN curl -L -o mule-runtime.zip "https://s3.amazonaws.com/mule-artifacts/releases/4.4.0/mule-runtime-4.4.0.zip" && \
    unzip mule-runtime.zip && \
    rm mule-runtime.zip

# Copy the Mule application JAR file to the container
COPY ./target/crud_demo-1.0.0-SNAPSHOT-mule-application.jar /opt/mule/apps/crud_demo.jar

# Expose any ports that your Mule application uses
EXPOSE 8081 8082

# Define the entrypoint command to start Mule
ENTRYPOINT ["/opt/mule/bin/mule"]
CMD ["-M", "start"]
