variable "instance_names" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}
variable "common_tags" {
  type = map(any)
  default = {
    Project   = "Expense"
    Terraform = "True"
  }
}

variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "domain" {
  default = "laven.cloud"
}

variable "zone_id" {
  default = "Z0920258HFVLFKHGIGVT"
}