terraform {
  backend "s3" {
    bucket         = "terraform-state-prod-driss"
    key            = "aws-infra/prod-1/terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}