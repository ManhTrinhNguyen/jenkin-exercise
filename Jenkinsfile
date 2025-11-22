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
                        env.IMAGE_VERSION = VERSION 
                    }
                }
            }
        }
        stage("test") {
            steps {
                script {
                    echo "Test"
                    dir('app') {
                        sh 'npm run test'
                    }
                }
            }
        }
        stage("build") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker_credential', usernameVariable: 'USER', passwordVariable: 'PWD')]){
                        echo "Building Application"
                        sh "docker build -t nguyenmanhtrinh/demo-app:nodejs-${env.IMAGE_VERSION} ."
                        sh "echo ${PWD} | docker login -u ${USER} --password-stdin"
                        sh "docker push nguyenmanhtrinh/demo-app:nodejs-${env.IMAGE_VERSION}"
                    }
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

