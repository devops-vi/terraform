variable "ami_id" {
    type = string  
}

variable "security_group_ids" {
    type = list(string)  
}

variable "instance_type" {
    default = "t3.micro"
    type = string
    validation {
        condition = contains(["t3.micro", "t3.medium", "t3.small"],var.instance_type)
        error_message = "Instance type can only be one of t3.micro or t3.medium or t3.small"
    }  
}