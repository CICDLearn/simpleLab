pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // UPDATE THIS URL BELOW
                git branch: 'main', url: 'https://github.com/CICDLearn/simpleLab.git'
            }
        }
        stage('Build Infrastructure') {
            steps {
                echo '--- Running Terraform (Creating Server) ---'
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
            }
        }
        stage('Configure Application') {
            steps {
                echo '--- Running Ansible (Configuring Server) ---'
                // This tells Ansible to look for a container named 'demo-web-server'
                sh 'ansible-playbook -i "demo-web-server," playbook.yml'
            }
        }
    }
}