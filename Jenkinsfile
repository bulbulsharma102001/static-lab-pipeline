pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "bbsharma102001/bulbul-ecomm"
        TAG = "555"
        BRANCH = "main"
    }

    stages {

        stage('Clone Repo') {
            steps {
                git branch: "${BRANCH}",
                url: 'https://github.com/bulbulsharma102001/static-lab-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %DOCKER_IMAGE%:%TAG% ."
                bat "docker tag %DOCKER_IMAGE%:%TAG% %DOCKER_IMAGE%:latest"
            }
        }

        stage('Login DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {

                    bat "docker login -u %USER% -p %PASS%"
                }
            }
        }

        stage('Push Image') {
            steps {
                bat "docker push %DOCKER_IMAGE%:%TAG%"
                bat "docker push %DOCKER_IMAGE%:latest"
            }
        }

    }

    post {
        success {
            echo '✅ Docker Image Successfully Built and Pushed'
        }

        failure {
            echo '❌ Pipeline Failed'
        }

        always {
            echo 'Pipeline Execution Completed'
        }
    }
}
