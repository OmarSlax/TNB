# Stage 1: Build the application with Maven
FROM maven:3.6.3 AS build
WORKDIR /app
COPY RedevableMicroservice/pom.xml .
COPY RedevableMicroservice/src ./src
RUN mvn clean package -DskipTests

# Stage 2: Create the final image
FROM openjdk:17-jre-slim
WORKDIR /app
COPY --from=build /app/target/RedevableMicroservice.jar /app/RedevableMicroservice.jar
CMD ["java", "-jar", "RedevableMicroservice.jar"]
