variable "ami_id" {
  type = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "ingress_from_port" {
    type = number
    default = 22  
}

variable "ingress_to_port" {
    type = number
    default = 22  
}

variable "ingress_protocol" {
    type = string
    default = "tcp"  
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks" {
    type = list(string)
    default = ["::/0"]  
}

variable "environment" {
    type = string
    default = "prod"  
}
