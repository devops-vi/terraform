terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.67.0"
    }
  }
  backend "s3" {
    bucket = "laven-terrafom-state"
    key = "laven-devops-key"
    region = "us-east-1"
    dynamodb_table = "terraform-practice"    
  }
}

provider "aws" {
    region = "us-east-1"  
}