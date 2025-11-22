pipeline {   
    agent any
    stages {
        stage("Increment Version") {
            steps {
               script {
                  dir('app') {
                    npm install
                  }
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

