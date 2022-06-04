pipeline {
    agent any

    stages {
        stage('Compile crNormz') {
            steps {
                sh '''
                crystal build src/crnormz.cr --release
                echo "crNormz has been successfully built."
                '''
            }
        }

        stage('Unit Testing') {
            stages {
                stage('O1 - Contents of the Delivery Folder') {
                    steps {
                        sh "echo 'toto'"
                    }
                }
            }
        }
    }
}
