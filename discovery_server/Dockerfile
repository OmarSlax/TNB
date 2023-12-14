# Stage 1: Build the application with Maven
FROM maven:3.6.3 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the final image with the compiled JAR
FROM openjdk:17-alpine
WORKDIR /app
COPY target/discovery_server*.jar /app/discovery_server.jar
CMD ["java", "-jar", "discovery_server.jar"]
EXPOSE 8761
