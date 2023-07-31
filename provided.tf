terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  #execution starts from here, so when you add backend in script, run terraform init again
  backend "s3" {
    bucket         = "hskpackertest"
    key            = "terraform_packer.tfstate"
    region         = "us-east-1"
    # dynamodb_table = "hskpackertestddb"
    # encrypt        = true
  }
}

# #Terraform statefile locking
# resource "aws_dynamodb_table" "terraform_packer_locking" {
#   name         = "hskpackertestddb"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }

# }

# Configure the AWS Provider
# provider "aws" {
#   region = "us-east-1"
#   #access_key = ""
#   #secret_key = ""
# }

# Credentials Usage.
# 1) Environment Variables.
# 2) Instance Profile Credentials and region.