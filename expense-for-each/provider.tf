terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }

  backend "s3" {
    bucket         = "laven-terrafom-state"
    key            = "key-for-expense-for-each"
    dynamodb_table = "terraform-practice"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}