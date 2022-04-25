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
                    sh 'docker build -t patel244/sample-for-jenkins-0.0.2 .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'patel244', variable: 'patel244')]) {
                    sh 'docker login -u patel244 -p ${patel244}'
}
                   # sh 'docker tag patel244/sample-for-jenkins-0.0.2 abc2345/myimage '
                    sh 'docker push patel244/sample-for-jenkins-0.0.2 '
                }
            }
        }



        }

    }
