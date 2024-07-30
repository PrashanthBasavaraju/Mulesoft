FROM maven:3.6.3-jdk-11

COPY . /app
WORKDIR /app

RUN mvn install
CMD ["mvn", "mule:run"]
