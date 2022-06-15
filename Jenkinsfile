pipeline {
    agent any

    stages {
        stage('Compile') {
            steps {
                script {
                    sh 'crystal build src/crnormz.cr --release'
                    if (fileExists('./crnormz')) {
                        echo 'crNormz has been successfully built.'
                    } else {
                        echo 'An error occured with compilation.'
                        exit(1)
                    }
                }
            }
        }

        stage('Unit Testing') {
            parallel {
                stage('O1 - Contents of the Delivery Folder') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/O1
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -f "expected.txt" -f "crnormz" -s`
                        if ! diff -q <(printf "\$output") expected.txt &>/dev/null; then
                            echo "Expected:"
                            cat expected.txt
                            echo "Got:"
                            echo "\$output"
                            exit 1
                        fi
                        """
                    }
                }
                stage('O3 - File Coherence') {
                    steps {
                            sh """#!/bin/bash
                        cd tests/O3
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -f "crnormz" -s`
                        if ! diff -q <(printf "\$output") expected.txt &>/dev/null; then
                            echo "Expected:"
                            cat expected.txt
                            echo "Got:"
                            echo "\$output"
                            exit 1
                        fi
                        """
                    }
                }
            }
        }
    }
    post {
        always {
            cleanWs(cleanWhenNotBuilt: false,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true,
                    patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
                               [pattern: '.propsfile', type: 'EXCLUDE']])
        }
    }
}
