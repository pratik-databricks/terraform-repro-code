terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.4.9"
    }
  }
}

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


resource "databricks_mws_networks" "NetworkOne" {
  provider           = databricks.mws
  account_id         = "a417f3b1-fe7a-40a0-81af-f973958f2c0c"
  network_name       = "Network-one"
  security_group_ids = ["sg-07473ed572ad12088"]
  subnet_ids         = ["subnet-009d2f8a4c14800db","subnet-01d7004dc314f26ca"]
  vpc_id             = "vpc-02cf6ca181c0c23d3"
}
