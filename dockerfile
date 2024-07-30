# Use the official Mule runtime base image
FROM mulesoft/mule-runtime:4.4.0

# Set the working directory inside the container
WORKDIR /opt/mule

# Copy the Mule application and configuration files to the container
COPY ./target/your-mule-app.jar /opt/mule/apps/your-mule-app.jar

# Copy any additional configuration files if necessary
# COPY ./path/to/config /opt/mule/conf

# Expose any ports that your Mule application uses
EXPOSE 8081 8082

# Define the entrypoint command to start Mule
ENTRYPOINT ["mule"]
CMD ["-M", "start"]
