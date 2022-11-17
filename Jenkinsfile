pipeline {
	agent any
	environment {
		GITHUB_CREDENTIALS=credentials('github_creds')
		DOCKERHUB_CREDENTIALS=credentials('dockerhub_creds')
	}
	stages {
//       stage('test') {
//            steps {
//                sh 'echo "test"'
//                sh 'docker run hello-world'
//                sh 'whoami'
//                sh 'echo $GITHUB_CREDENTIALS_USR'
//                sh 'echo $DOCKERHUB_CREDENTIALS_USR'
//            }
//        }
		stage("Git Checkout") {
			steps {
				git credentialsId: 'GITHUB_CREDENTIALS', url: 'https://github.com/mikhailklimov1/docker-jenkins-integration', branch: 'podman_test'
				echo 'Git Checkout Completed'
			}
		}
		stage('Build Docker Image') {
			steps {
				sh 'podman build -t mikhailklimov/docker-jenkins-integration:latest .'
				echo 'Build Image Completed'
			}
		}
		stage('Login to Docker Hub') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | podman login docker.io -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
				echo 'Login Completed'
			}           
		}
		stage('Push Image to Docker Hub') {
			steps {
				sh 'podman push mikhailklimov/docker-jenkins-integration:latest'
				echo 'Push Image Completed' 
			}
		}
		stage('Remove docker image from host') {
			steps {
				sh 'podman rmi mikhailklimov/docker-jenkins-integration:latest'
			}
		}
	}
	post {
		always {
			sh 'podman logout docker.io'           
		}
	}
}
