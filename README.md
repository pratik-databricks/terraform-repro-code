# terraform-repro-code
Add desired code to this repository for reproducing the issues.

Use below data blocks for retrieving E2 account email and password already set in SSM parameter store -

data "aws_ssm_parameter" "e2email" {
  name = "e2accountemail"
}

data "aws_ssm_parameter" "e2password" {
  name = "e2accountpassword"
}
