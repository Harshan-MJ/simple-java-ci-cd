pipeline {
    agent any

    environment {
        // Link to Jenkins credentials ID
        DOCKERHUB = credentials('dockerhub-creds')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Harshan-MJ/simple-java-ci-cd.git'
            }
        }

        stage('Build Java App') {
            steps {
                sh 'javac HelloWorld.java'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKERHUB_USR/simple-java-ci-cd:latest .'
            }
        }

        stage('Login to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_PSW | docker login -u $DOCKERHUB_USR --password-stdin'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'docker push $DOCKERHUB_USR/simple-java-ci-cd:latest'
            }
        }
    }

    post {
        always {
            sh 'docker logout'
        }
    }
}

