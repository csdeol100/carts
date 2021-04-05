pipeline {
  agent {
    label 'master'
  }
    tools {
      jdk 'jdk11'
      maven 'm3'
    }

    stages {
      stage('Declarative Checkout'){
        steps{
          sh "echo Checking out Code"
          checkout([$class: 'GitSCM', branches: [[name: '*/feature/charan']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/csdeol100/carts.git']]])
        }
      }
      stage('Compile'){
        steps{
          sh "mvn compile"
        }
      }
      stage('Package Application'){
        steps{
          sh "mvn package -DskipTests"
        }
      }
      stage('Archiving Artifacts'){
        steps{
          archiveArtifacts artifacts: 'target/*.jar', followSymlinks: false
        }
      }
      stage('Build Image'){
        steps{
          sh "docker image build . -t csdeol100/carts:v1"
        }
      }
      stage('Publish Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                  sh "docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}"
                  sh "docker image push csdeol100/carts:v1"
                }
            }
        }
    }
}
