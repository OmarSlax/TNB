# Stage 1: Build CategorieTerrainMicroservice with Maven
FROM maven:3.6.3 AS build-categorie
WORKDIR /app/CategorieTerrainMicroservice
COPY CategorieTerrainMicroservice/pom.xml .
COPY CategorieTerrainMicroservice/src ./src
RUN mvn clean package -DskipTests

# Stage 2: Build RedevableMicroservice with Maven
FROM maven:3.6.3 AS build-redevable
WORKDIR /app/RedevableMicroservice
COPY RedevableMicroservice/pom.xml .
COPY RedevableMicroservice/src ./src
RUN mvn clean package -DskipTests

# Stage 3: Build TerrainMicroservice with Maven
FROM maven:3.6.3 AS build-terrain
WORKDIR /app/TerrainMicroservice
COPY TerrainMicroservice/pom.xml .
COPY TerrainMicroservice/src ./src
RUN mvn clean package -DskipTests

# Stage 4: Build discovery_server with Maven
FROM maven:3.6.3 AS build-discovery
WORKDIR /app/discovery_server
COPY discovery_server/pom.xml .
COPY discovery_server/src ./src
RUN mvn clean package -DskipTests

# Stage 5: Create the final image
FROM openjdk:17-jre-slim

WORKDIR /app

# Copy the JAR files from each service build stage
COPY --from=build-categorie /app/CategorieTerrainMicroservice/target/CategorieTerrainMicroservice.jar /app/CategorieTerrainMicroservice.jar
COPY --from=build-redevable /app/RedevableMicroservice/target/RedevableMicroservice.jar /app/RedevableMicroservice.jar
COPY --from=build-terrain /app/TerrainMicroservice/target/TerrainMicroservice.jar /app/TerrainMicroservice.jar
COPY --from=build-discovery /app/discovery_server/target/discovery_server.jar /app/discovery_server.jar

# Specify the command to run on container start
CMD ["java", "-jar", "CategorieTerrainMicroservice.jar", "&&", "java", "-jar", "RedevableMicroservice.jar", "&&", "java", "-jar", "TerrainMicroservice.jar", "&&", "java", "-jar", "discovery_server.jar"]
