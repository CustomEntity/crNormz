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
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -f "expected.txt" -s`
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
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('O4 - Naming Files and Folders') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/O4
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('G1 - File Header') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/G1
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('G2 - Separation of functions') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/G2
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('G3 - Indentation of preprocessor directives') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/G3
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('G6 - Include') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/G6
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('G7 - Line Endings') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/G7
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('G8 - Trailing Spaces') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/G8
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('G9 - Trailing Lines') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/G9
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('F2 - Naming functions') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/F2
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('F3 - Number of columns') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/F3
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('F4 - Number of Lines') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/F4
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('F5 - Arguments') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/F5
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('F6 - Comments inside a function') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/F6
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('L1 - Code line content') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/L1
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('L2 - Indentation') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/L2
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('L4 - Curly brackets') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/L4
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('V1 - Naming Identifiers') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/V1
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('V3 - Pointers') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/V3
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('C1 - Conditional Branching') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/C1
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('C3 - Goto') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/C3
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('A3 - Line break at the end of file') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/A3
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('H2 - Include Guard') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/H2
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
                stage('H3 - Macros') {
                    steps {
                        sh """#!/bin/bash
                        cd tests/H3
                        output=`${WORKSPACE}/crnormz --raw-output -f "TO_IMPROVE" -s`
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
