pipeline {
     agent any
     stages {
         stage('Linting') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Build Image') {
              steps {
                  sh 'docker build -t udacity-cloud-devops-capstone .'
              }
         }
     }
}
