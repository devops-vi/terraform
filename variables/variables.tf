variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "This variable is to define the ami id of DevOps-prctice ami"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = " default instance type"
}

variable "ingress_from_port" {
    default = 22  
}

variable "ingress_to_port" {
    default = 22  
}
variable "protocol" {
    default = "tcp"  
}
variable "ingress_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]     
}

variable "tags" {
    type = map
    default = {
        Name = "backend"
        Project = "Expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = "True"
    } 
}

variable "sg_name" {
    default = "allow_all_terraform"  
}

variable "sg_description" {
    default = "Allow all ports"
  
}


