pipeline{
    agent any
    tools {
        terraform 'terraform'
    }
    stages{
        stage("Git Checkout"){
            steps{
             git branch: 'main', credentialsId: '8c0a47f9-90f4-4ed2-a8a1-00382ff53e66', url: 'https://github.com/pratik-databricks/terraform-repro-code.git'
            }
        }
        stage("Terraform Init"){
            steps{
                sh 'terraform init'
            }
        }
        stage("Terraform action"){
            steps{
                if (action == list_resources){
                    sh 'terraform state list'
                }
                else {
                sh 'terraform ${action} --auto-approve'
                }
            }
        }
    }

}
