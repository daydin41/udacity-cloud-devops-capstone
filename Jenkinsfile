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
                      sh "aws eks --region us-west-2 update-kubeconfig --name devopscluster"
                      sh "kubectl config use-context arn:aws:eks:us-west-2:656321790976:cluster/devopscluster"
                      sh "kubectl set image deployments/udacity-cloud-devops-capstone udacity-cloud-devops-capstone=daydin41/udacity-cloud-devops-capstone:latest"
                      sh "kubectl apply -f deployment/nginx-deployment.yml"                      
                      sh 'kubectl apply -f deployment/service.yml'
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/udacity-cloud-devops-capstone"
                  }
              }
          }
          
     }
}
