# Stage 1: Build the application with Maven
FROM maven:3.6.3 AS build
WORKDIR /app
COPY CategorieTerrainMicroservice/pom.xml .
COPY CategorieTerrainMicroservice/src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM openjdk:17-jre-slim
WORKDIR /app
COPY --from=build /app/target/CategorieTerrainMicroservice.jar /app/CategorieTerrainMicroservice.jar
CMD ["java", "-jar", "CategorieTerrainMicroservice.jar"]
