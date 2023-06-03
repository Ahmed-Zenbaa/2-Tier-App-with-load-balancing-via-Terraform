# Configure the provider software version
terraform {
  backend "s3" {
  bucket = "iti-bucket-9999"
  dynamodb_table = "my-dynamo-db-state-lock"
  encrypt = true
  key    = "terra-backend/terraform.tfstate"
  region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

