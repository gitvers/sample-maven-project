pipeline{
    agent any
    tools {
        maven 'maven-3.8'
    }
    stages{
        stage('Build Maven') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/gitvers/sample-maven-project.git']]])
                sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t myimage/sample-for-jenkins-0.0.1 .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerpwd', variable: 'dockerpwd')]) {
                    sh 'docker login -u patel244 -p ${dockerpwd}'
}
                    sh 'docker tag myimage/sample-for-jenkins-0.0.1 abc2345/myimage '
                    sh 'docker push myimage/sample-for-jenkins-0.0.1 '
                }
            }
        }



        }

    }
