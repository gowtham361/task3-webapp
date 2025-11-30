pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'task3-webapp'
        DOCKER_CONTAINER = 'task3-container'
        PORT = '8083'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/gowtham361/task3-webapp.git'
            }
        }

        stage('Maven Build') {
            steps {
                sh 'mvn clean package -DskipTests'
                sh 'cp target/task3-webapp.war .'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                docker stop ${DOCKER_CONTAINER} || true
                docker rm ${DOCKER_CONTAINER} || true
                docker run -d -p ${PORT}:8080 --name ${DOCKER_CONTAINER} ${DOCKER_IMAGE}
                """
            }
        }
    }

    post {
        always { echo "Pipeline finished." }
        success { echo "Deployment successful! Visit http://13.222.15.168:${PORT}" }
        failure { echo "Pipeline failed. Check console output for details." }
    }
}
