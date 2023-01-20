pipeline{
    agent any
    stages{
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
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
        	sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
            sh 'docker push vikash32/helloworlddemo:0.1'
        }
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}