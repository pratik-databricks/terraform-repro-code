# terraform-repro-code
Add desired code to this repository for reproducing the issues.

Use below data blocks for retrieving E2 account email and password already set in SSM parameter store -

    data "aws_ssm_parameter" "e2email" {
      name = "e2accountemail"
    }

    data "aws_ssm_parameter" "e2password" {
      name = "e2accountpassword"
    }

    provider "databricks" {
      alias    = "mws"
      host     = "https://accounts.cloud.databricks.com"
      username = data.aws_ssm_parameter.e2email.value
      password = data.aws_ssm_parameter.e2password.value
    }

*Always use the latest version of databricks terraform registry to avoid unexpected issues. Check the latest version at https://registry.terraform.io/providers/databrickslabs/databricks*

    terraform {
      required_providers {
        databricks = {
          source  = "databrickslabs/databricks"
          version = "x.x.x"
        }
      }
    }
