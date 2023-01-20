pipeline{
    agent{
        label "linux"
    }
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', 
        daysToKeepStr: '', numToKeepStr: '')
    }
    stages{
        stage("Clean"){
            steps{
                echo "========== Clean ============="
                sh 'mvn clean'
            }
        }
        stage("Compile"){
            steps{
                echo "========compiling========"
                sh 'mvn compile'
            }
            post{
                always{
                    echo "========always========"
                }
                success{
                    echo "========A executed successfully========"
                }
                failure{
                    echo "========A execution failed========"
                }
            }
        }
        stage("Packaging"){
            steps{
                echo "============= Packaging ==============="
                sh 'mvn package'
            }
        }
        stage("OnlyAtDev"){
            when {
                branch "dev*"
            }
            steps {
                sh 'date'
            }
        }
    }
    post{
        always{
            echo "========always========"
        }
        success{
            echo "========pipeline executed successfully ========"
        }
        failure{
            echo "========pipeline execution failed========"
        }
    }
}