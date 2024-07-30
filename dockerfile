# Use an official Mule runtime base image with an accessible version
FROM mulesoft/flex-gateway

# Set the working directory inside the container
WORKDIR /opt/mule

# Download and install Mule runtime if needed
# RUN curl -L -o mule-runtime.zip "URL" && unzip mule-runtime.zip && rm mule-runtime.zip

# Copy the Mule application JAR file to the container
COPY target/crud_demo-1.0.0-SNAPSHOT-mule-application.jar /opt/mule/apps/crud_demo.jar

# Expose any ports that your Mule application uses
EXPOSE 8081 8082

# Define the entrypoint command to start Mule
ENTRYPOINT ["/opt/mule/bin/mule"]
CMD ["-M", "start"]
