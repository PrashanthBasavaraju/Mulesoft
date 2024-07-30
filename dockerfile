# Use an official MuleSoft image as a parent image
FROM mulesoft/mule-runtime:4.3.0

# Set the working directory in the container
WORKDIR /opt/mule

# Copy the Mule application to the container
COPY target/crud_demo-1.0.0-SNAPSHOT-mule-application.jar /opt/mule/apps/crud_demo.jar

# Expose the port your application runs on
EXPOSE 8081

# Run the Mule application
CMD ["mule"]
