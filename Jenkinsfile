pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                sh '''
                crystal build src/crnormz.cr --release
                echo "crNormz has been successfully built."
                '''
            }
        }

        stage('Unit Testing') {
            parallel {
                stage('O1 - Contents of the Delivery Folder') {
                    steps {
                        sh """
                        cd /tests/O1
                        ${WORKSPACE}/crnormz
                        """
                    }
                }
                stage('O3 - File Coherence') {
                    steps {
                        sh "echo 'tutu'"
                    }
                }
            }
        }

        stage('Cleanup') {
            cleanWs()
        }
    }
}
