pipeline {
    agent any

    environment {
        DOCKER_USER = credentials('dockerhub-username') // Jenkins credentials ID
        DOCKER_PASS = credentials('dockerhub-password')
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/<your-username>/<repo-name>.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker Build & Push') {
            steps {
                sh '''
                docker build -t $DOCKER_USER/hello-world:latest .
                echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
                docker push $DOCKER_USER/hello-world:latest
                '''
            }
        }
    }
}

