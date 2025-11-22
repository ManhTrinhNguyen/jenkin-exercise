pipeline {   
    agent any
    stages {
        stage("Increment Version") {
            steps {
                script {
                    echo "Increment version"
                    sh 'pwd'
                    sh 'ls /app'
                }
            }
        }
        stage("build") {
            when {
                expression {
                    BRANCH_NAME == "main"
                }
            }
            steps {
                script {
                    echo "Building Application"
                }
            }
        }
        stage("deploy"){
            steps {
               echo "Deploying Application"
            }
        }
    } 
}

