pipeline {
    agent any
    stages {
        stage('Preparing for Build') {
            steps {
                script {
                    def isContainerExists = sh(script: "docker ps -q -f name='lab4'", returnStdout: true) != ""
                    def isImageExists = sh(script: "docker images -q lab4", returnStdout: true) != ""


                    echo "${isContainerExists}"
                    echo "${isImageExists}"

                    if (isContainerExists) {
                        sh 'docker stop -t 0 lab4'
                        sh 'docker rm lab4'
                    }

                    if (isImageExists) {
                        sh 'docker rmi lab4'
                    }
                }
            }
        }
        stage('Build Docker Image') {
        steps {
                sh 'docker build -t lab4 .'
            }
        }
        stage ('Start Application in Docker') {
            steps {
                sh 'docker run -d --name lab4 lab4'
            }
        }
    }
}