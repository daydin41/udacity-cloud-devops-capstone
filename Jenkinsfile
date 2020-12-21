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
         stage('Deploying') {
              steps{
                  echo 'Deploying to AWS...'
                  withAWS(credentials: 'aws-static', region: 'us-west-2') {
                      sh "kubectl config use-context arn:aws:eks:us-west-2:656321790976:cluster/devopscluster"
                      sh "kubectl apply -f deployment/nginx-deployment.yml"                      
                      sh 'kubectl apply -f deployment/service.yml'

                  }
              }
          }
          
     }
}
