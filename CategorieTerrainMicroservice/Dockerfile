# Stage 1: Build the application with Maven
FROM maven:3.6.3 AS build
WORKDIR /app
COPY CategorieTerrainMicroservice/ .
RUN mvn clean package -DskipTests

# Stage 2: Create the final image with the compiled JAR
FROM openjdk:17-alpine
WORKDIR /app
COPY CategorieTerrainMicroservice/target/CategorieTerrainMicroservice*.jar /app/categorie-terrain-service.jar
CMD ["java", "-jar", "categorie-terrain-service.jar"]
EXPOSE 8082
