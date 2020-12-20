pipeline {
     agent any
     stages {
         stage('Linting') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Build Docker Image') {
              steps {
                  sh 'docker build -t udacity-cloud-devops-capstone .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                      sh "docker tag udacity-cloud-devops-capstone daydin41/udacity-cloud-devops-capstone"
                      sh 'docker push daydin41/udacity-cloud-devops-capstone'
                  }
              }
         }
     }
}
