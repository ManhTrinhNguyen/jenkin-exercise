pipeline {   
    agent any
    stages {
        stage("test") {
            steps {
               script {
                  echo "Testing Applications"
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