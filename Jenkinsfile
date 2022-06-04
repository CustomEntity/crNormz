pipeline {
    agent any

    stages {
        stage('Compile crNormz') {
            steps {
                sh 'crystal build src/crnormz.cr --release'
            }
        }
    }
}
