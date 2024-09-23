terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.67.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"  
}

variable "security_group_id" {
    default = "sg-088988091b81eae5c"  
}

data "aws_security_group" "allow_all" {
    id = var.security_group_id
}

variable "vpc_id" {
  
}

data "aws_vpc" "sg_vpc_id" {
  id = var.vpc_id  
}

resource "aws_subnet" "name" {
  vpc_id            = data.aws_vpc.selected.id
  availability_zone = "us-east-1a"  
}
