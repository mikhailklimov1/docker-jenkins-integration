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
//                sh 'pwd'
//                sh 'echo $GITHUB_CREDENTIALS_USR'
//                sh 'echo $DOCKERHUB_CREDENTIALS_USR'
//            }
//        }
	    	stage("Git checkout") {
            		steps {
                		git credentialsId: 'GITHUB_CREDENTIALS', url: 'https://github.com/mikhailklimov1/docker-jenkins-integration', branch: 'nodejs_test'
	            		echo 'Git Checkout Completed'
            		}
        	}
		stage('Linter test') {
			steps{
                		script {
                    			sh "echo Linter test"
                		}
            		}
        	}
        	stage('Build image') {
			steps {
				sh 'podman build -t mikhailklimov/nodejs-hello-world:latest .'
				echo 'Build Image Completed'
            		}
        	}
        	stage('Login to Docker Hub') {
			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | podman login docker.io -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
				echo 'Login Completed'
			}           
		}
		stage('Push image to Docker Hub') {
			steps {
				sh 'podman push mikhailklimov/nodejs-hello-world:latest'
				echo 'Push Image Completed' 
			}
		}
//		stage('Remove image from host') {
//	        steps {
//	            sh 'podman rmi mikhailklimov/nodejs-hello-world:latest'
//	        }
//		}
	}
	post {
	    always {
			sh 'podman logout docker.io'           
		}
	}
}
