pipeline {
    agent any

    parameters {
        choice(name: 'APP_VERSION', choices: ['all', 'v1', 'v2', 'v3'], description: 'Select version to build, push and deploy')
        string(name: 'DOCKERHUB_USERNAME', defaultValue: '24mis0384', description: 'Docker Hub Username / Repository namespace')
        string(name: 'DOCKER_IMAGE_NAME', defaultValue: 'notification-app', description: 'Docker Image Name')
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
                    def isWin = !isUnix()
                    if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v1') {
                        echo "Building Docker image for v1 (Add Alert)..."
                        if (isWin) {
                            bat "docker build -t ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v1 ./v1"
                        } else {
                            sh "docker build -t ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v1 ./v1"
                        }
                    }
                    if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v2') {
                        echo "Building Docker image for v2 (View Alert)..."
                        if (isWin) {
                            bat "docker build -t ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v2 ./v2"
                        } else {
                            sh "docker build -t ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v2 ./v2"
                        }
                    }
                    if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v3') {
                        echo "Building Docker image for v3 (Delete Alert)..."
                        if (isWin) {
                            bat "docker build -t ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v3 ./v3"
                        } else {
                            sh "docker build -t ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v3 ./v3"
                        }
                    }
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                script {
                    def isWin = !isUnix()
                    echo "Pushing built Docker images to DockerHub..."
                    try {
                        if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v1') {
                            if (isWin) {
                                bat "docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v1"
                            } else {
                                sh "docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v1"
                            }
                        }
                        if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v2') {
                            if (isWin) {
                                bat "docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v2"
                            } else {
                                sh "docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v2"
                            }
                        }
                        if (params.APP_VERSION == 'all' || params.APP_VERSION == 'v3') {
                            if (isWin) {
                                bat "docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v3"
                            } else {
                                sh "docker push ${params.DOCKERHUB_USERNAME}/${params.DOCKER_IMAGE_NAME}:v3"
                            }
                        }
                    } catch (Exception e) {
                        echo "Docker push warning: ${e.getMessage()}. Make sure you are logged in via 'docker login'."
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    def isWin = !isUnix()
                    echo "Deploying applications to Kubernetes cluster..."
                    try {
                        if (params.APP_VERSION == 'all') {
                            if (isWin) { bat 'kubectl apply -f k8s/all-deployments.yaml' }
                            else { sh 'kubectl apply -f k8s/all-deployments.yaml' }
                        } else if (params.APP_VERSION == 'v1') {
                            if (isWin) { bat 'kubectl apply -f k8s/v1-deployment.yaml' }
                            else { sh 'kubectl apply -f k8s/v1-deployment.yaml' }
                        } else if (params.APP_VERSION == 'v2') {
                            if (isWin) { bat 'kubectl apply -f k8s/v2-deployment.yaml' }
                            else { sh 'kubectl apply -f k8s/v2-deployment.yaml' }
                        } else if (params.APP_VERSION == 'v3') {
                            if (isWin) { bat 'kubectl apply -f k8s/v3-deployment.yaml' }
                            else { sh 'kubectl apply -f k8s/v3-deployment.yaml' }
                        }
                    } catch (Exception e) {
                        echo "Kubernetes deployment warning: ${e.getMessage()}."
                    }
                }
            }
        }

        stage('Verify Deployments') {
            steps {
                script {
                    def isWin = !isUnix()
                    echo "Displaying Kubernetes Pods and Services:"
                    try {
                        if (isWin) {
                            bat 'kubectl get pods -l app=notification'
                            bat 'kubectl get svc -l app=notification'
                        } else {
                            sh 'kubectl get pods -l app=notification'
                            sh 'kubectl get svc -l app=notification'
                        }
                    } catch (Exception e) {
                        echo "Kubernetes status check: ${e.getMessage()}."
                    }
                }
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
