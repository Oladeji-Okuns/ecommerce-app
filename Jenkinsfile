pipeline {
  agent any

  environment {
    DOCKER_HUB_REPO = 'dejdocka/ecommerce-website'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Images') {
      steps {
        sh 'docker-compose build'
      }
    }

    stage('Run Tests') {
      steps {
        sh 'docker-compose up -d'
        sh 'sleep 10'
        sh 'bash scripts/test.sh'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
          sh 'docker tag ecommerce-website_frontend $DOCKER_HUB_REPO-frontend:latest'
          sh 'docker tag ecommerce-website_backend $DOCKER_HUB_REPO-backend:latest'
          sh 'docker push $DOCKER_HUB_REPO-frontend:latest'
          sh 'docker push $DOCKER_HUB_REPO-backend:latest'
        }
      }
    }

    stage('Deploy to Server') {
      steps {
        sh 'bash scripts/deploy.sh'
      }
    }
  }
}
