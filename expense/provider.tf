terraform {
  required_providers {
    aws = {
        sourec = "hashicorp/aws"
        version = "5.67.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"  
}