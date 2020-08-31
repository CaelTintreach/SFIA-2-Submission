pipeline{
    agent any
    stages{
        stage("Make Scripts Executable"){
            steps{
                sh 'chmod +x ./scripts/*'
            }
        }
        stage("Run tests"){
            steps{
                sh './scripts/test.sh'
            }
        }
        stage("Install Ansible and Run Playbook."){
            steps{
                sh './scripts/ansible.sh'
            }
        }
        stage("Configures Docker."){
            steps{
                sh './scripts/docker.sh'
            }
        }
        stage("Deploys Via Swarm") {
            steps {
                sh './scripts/deploy.sh'
            }        
        }
    }
}