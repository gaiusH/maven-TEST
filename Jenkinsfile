pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
    environment {
    registry = '472391956991.dkr.ecr.us-east-1.amazonaws.com/terra-geolocation-ecr-jenkins'
    registryCredential = 'aws credentials'
    dockerimage = ''
  }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/gaiusH/maven-TEST.git'
            }
        }
        stage ("Sonarqube scan") {
          steps{
          withSonarQubeEnv('sonar') {
        sh 'mvn verify org.sonarsource.scanner.maven:sonar-maven-plugin:sonar -Dsonar.projectKey=gaiusH_geolocation-job'

                }   
                
          } 
        }
        stage('Code Build') {
            steps {
                sh 'mvn clean install package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Image') {
            steps {
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                } 
            }
        }
        stage('Deploy image') {
            steps{
                script{ 
                    docker.withRegistry("https://"+registry,"ecr:us-east-1:"+registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }  
    }
}
