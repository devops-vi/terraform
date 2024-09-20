variable "instance_names" {
    type  = list(string)
    default = ["mysql","backend","frontend"]
  
}
variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
  
}

variable "common_tags" {
    type = map
    default = {
        Project = "Expense"
        Terraform = "True"
    }  
}