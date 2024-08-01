# Stage 1: Build the application
FROM maven:3.8.4-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package
RUN ls -l /app/target

# Stage 2: Set up Mule Runtime and application
FROM mulesoft/flex-gateway:latest

# Set the working directory inside the container
WORKDIR /opt/mule

# Copy the Mule application JAR file from the build stage to the Mule runtime
COPY --from=build /app/target/validation-1.0.0-SNAPSHOT-mule-application.jar /opt/mule/apps/crud_demo.jar
# Expose any ports that your Mule application uses
EXPOSE 8081 8082

# Define the entrypoint command to start Mule
ENTRYPOINT ["/opt/mule/bin/mule"]
CMD ["-M", "start"]