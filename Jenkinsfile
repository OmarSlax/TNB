pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build Services') {
            steps {
                script {
                    // Build CategorieTerrainMicroservice
                    sh "docker build -t categorie-service -f CategorieTerrainMicroservice/Dockerfile ."
                    
                    // Build RedevableMicroservice
                    sh "docker build -t redevable-service -f RedevableMicroservice/Dockerfile ."
                    
                    // Build TerrainMicroservice
                    sh "docker build -t terrain-service -f TerrainMicroservice/Dockerfile ."
                    
                    // Build discovery_server
                    sh "docker build -t discovery-service -f discovery_server/Dockerfile ."
                }
            }
        }

        stage('Run Containers Locally') {
            steps {
                script {
                    // Run containers locally (adjust the port mappings and other options as needed)
                    sh "docker run -d --name categorie-container -p 8081:8081 categorie-service"
                    sh "docker run -d --name redevable-container -p 8082:8082 redevable-service"
                    sh "docker run -d --name terrain-container -p 8083:8083 terrain-service"
                    sh "docker run -d --name discovery-container -p 8761:8761 discovery-service"
                }
            }
        }

        // Add more stages for deployment or other steps as needed
    }
}
