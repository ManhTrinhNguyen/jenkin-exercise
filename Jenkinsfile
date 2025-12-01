@Library('Nodejs')
pipeline {   
    agent any
    stages {
        stage("Increment Version") {
            steps {
                script {
                    increment-nodejs-image-version()
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
        stage("Commit to Git"){
            steps {
                withCredentials([usernamePassword(credentialsId: 'github_credential', usernameVariable: 'USER', passwordVariable: 'PWD')]){
                    sh 'git config --global user.email "jenkins@gmail.com"'
                    sh 'git config --global user.name "Jenkins"'

                    sh 'git add .'
                    sh 'git commit -m "ci: version bump"'
                    sh "git push https://${USER}:${PWD}@github.com/${USER}/jenkin-exercise.git HEAD:main"
                }

            }
        }
    } 
}

