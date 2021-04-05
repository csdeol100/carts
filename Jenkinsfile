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
    }
}
