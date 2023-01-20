pipeline{
    agent any
    stages{
        stage("Maven Clean") {
            steps{
                echo "================ Maven Clean =============="
                sh 'mvn clean'
            }
        }
        stage("Maven package") {
            steps{
                echo "================ Maven Clean =============="
                sh 'mvn package'
            }
        }
        stage("Docker Build"){
            steps{
                echo "======== build image ========"
                sh 'docker build -t vikash32/helloworlddemo:0.1 .'
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
            withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh 'docker push vikash32/helloworlddemo:0.1'
        }
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}