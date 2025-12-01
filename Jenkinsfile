@Library('Nodejs') _
pipeline {   
    agent any
    stages {
        stage("Increment Version") {
            steps {
                script {
                    incrementNodejsImageVersion();
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
                    buildAndPushDockerImage();
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
                    sh "git push https://${USER}:${PWD}@github.com/${USER}/jenkin-exercise.git HEAD:share-library"
                }

            }
        }
    } 
}