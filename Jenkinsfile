pipeline {
    agent any

    stages {
        stage('Compile crNormz') {
            steps {
                crystal build src/crnormz.cr --release
            }
        }
    }
}
