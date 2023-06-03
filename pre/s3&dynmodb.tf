provider "aws" {
  region = "us-east-1"
}

#.... s3 bucket for terraform state

resource "aws_s3_bucket" "iti-bucket-9999" {
  bucket = "iti-bucket-9999"
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  lifecycle {
    prevent_destroy = true
  }
}

#.... DynamoDB for locking the state file

resource "aws_dynamodb_table" "my-dynamo-db-state-lock" {
  hash_key = "LockID"
  name     = "my-dynamo-db-state-lock"
  attribute {
    name = "LockID"
    type = "S"
  }
  billing_mode = "PAY_PER_REQUEST"
}