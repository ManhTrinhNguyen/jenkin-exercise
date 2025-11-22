pipeline {   
    agent any
    stages {
        stage("Increment Version") {
            steps {
                script {
                    echo "Increment version"
                    
                    dir('app') {
                        sh 'npm install'
                        sh 'npm version patch --no-git-tag-version'
                        def jsonConfig = readJSON file: 'package.json'
                        def VERSION = jsonConfig.version
                        echo "Version: ${VERSION}"
                        env.IMAGE_VERSION = VERSION 
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

