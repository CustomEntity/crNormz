pipeline {
    agent any
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '5', daysToKeepStr: '', numToKeepStr: '5')
    }
    stages {
        stage('Compile crNormz') {
            steps {
                sh
                '''
                crystal build src/crnormz.cr --release
                '''
            }
        }
    }
}
