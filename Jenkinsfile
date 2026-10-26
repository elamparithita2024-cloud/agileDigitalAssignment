pipeline {
    agent any

    parameters {
        choice(name: 'APP_VERSION', choices: ['all', 'v1', 'v2', 'v3'], description: 'Select version to build, push and deploy')
        string(name: 'DOCKERHUB_USERNAME', defaultValue: '24mis0384', description: 'Docker Hub Username / Repository namespace')
        string(name: 'DOCKER_IMAGE_NAME', defaultValue: 'notification-app', description: 'Docker Image Name')
    }

    environment {
        // Jenkins Docker Hub credential ID configured in Jenkins Credentials Manager
        DOCKER_CREDENTIAL_ID = 'dockerhub-credentials'
    }

    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out source code for Notification Application (24MIS0384)...'
                checkout scm
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v1') {
                        echo "Building Docker image for v1 (Add Alert)..."
                        sh "docker build -t ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v1 ./v1"
                    }
                    if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v2') {
                        echo "Building Docker image for v2 (View Alert)..."
                        sh "docker build -t ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v2 ./v2"
                    }
                    if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v3') {
                        echo "Building Docker image for v3 (Delete Alert)..."
                        sh "docker build -t ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v3 ./v3"
                    }
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    echo "Logging into DockerHub and pushing images..."
                    // In Jenkins with Docker plugin or credentials binding:
                    withCredentials([usernamePassword(credentialsId: env.DOCKER_CREDENTIAL_ID, usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                        sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'

                        if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v1') {
                            sh "docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v1"
                        }
                        if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v2') {
                            sh "docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v2"
                        }
                        if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v3') {
                            sh "docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v3"
                        }
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo "Deploying applications to Kubernetes cluster..."
                    if (params.APP_VERSION == 'all') {
                        sh 'kubectl apply -f k8s/all-deployments.yaml'
                    } else if (params.APP_VERSION == 'v1') {
                        sh 'kubectl apply -f k8s/v1-deployment.yaml'
                    } else if (params.APP_VERSION == 'v2') {
                        sh 'kubectl apply -f k8s/v2-deployment.yaml'
                    } else if (params.APP_VERSION == 'v3') {
                        sh 'kubectl apply -f k8s/v3-deployment.yaml'
                    }
                }
            }
        }

        stage('Verify Deployments') {
            steps {
                echo "Displaying Kubernetes Pods and Services:"
                sh 'kubectl get pods -l app=notification'
                sh 'kubectl get svc -l app=notification'
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully for Notification App (Roll No: 24MIS0384)!"
        }
        failure {
            echo "Pipeline failed. Check stage logs for details."
        }
    }
}
