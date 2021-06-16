pipeline {
    agent any

    stages {
        
        
        stage('Example SSH Username with private key') {
            environment {
                SSH_CREDS = credentials('github-ssh-key-micro')
            }
            steps {
                sh 'echo "SSH private key is located at $SSH_CREDS"'
                sh 'echo "SSH user is $SSH_CREDS_USR"'
                sh 'echo "SSH passphrase is $SSH_CREDS_PSW"'
            }
            
        }
            
        stage('Get Source') {
            //copy source code from local file system and test
            //for a Dockerfile to build the Docker image
            steps{
			    withCredentials(bindings: [sshUserPrivateKey(credentialsId: 'github-ssh-key-micro', \
                           keyFileVariable: '~/.ssh/id_rsa_jg', \
						   passphraseVariable: '', \
						   usernameVariable: '')]){
						   
                    git ('https://github.com/YevhenVieskov/ML_microservice.git')
                    //if(!fileExists("./mnist-microservice/Dockerfile")){
                   //    error''('Dockerfile missing') 
                  //}
				} 
            }
        }
        
        stage('Build Docker') {
           //build the docker image from the source code
           steps{
               sh "cd mnist-microservice"
               sh "docker build -t mnist_microservice_test ."
           }
        }
        
        stage("Run Docker Container") {
            steps{
                sh   "docker run -d -p 5000:5000 mnist_microservice_test"
            }
               
        }
        
        
        stage('Parallel Docker Run') {
            steps{
                sh "cd ../"
                sh "docker-compose up --build"
            }
        }
		
		stage('Test') {
		    steps {
			    sh 'python test.py'
			}
		}
		
		stage('Deploy') {
		    when {
			    expression {
				    currentBuild.result == null || currentBuild.result == 'SUCCESS'
				}
			}	
		    steps {
			    sh 'python test.py' //there must be command fo microservice running
			}
		}
		
        
    }
}
