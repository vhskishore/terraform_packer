terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  #execution starts from here, so when you add backend in script, run terraform init again
  backend "s3" {
    bucket = "hskpackertest"
    key = "terraform_packer.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
# provider "aws" {
#   region = "us-east-1"
#   #access_key = ""
#   #secret_key = ""
# }

# Credentials Usage.
# 1) Environment Variables.
# 2) Instance Profile Credentials and region.