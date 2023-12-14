# Stage 1: Build the application with Maven
FROM maven AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the final image with the compiled JAR
FROM openjdk:17-alpine
WORKDIR /app
COPY target/TerrainMicroservice*.jar /app/terrain-service.jar
CMD ["java", "-jar", "terrain-service.jar"]
EXPOSE 8084
