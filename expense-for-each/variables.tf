variable "instance_names" {
  default = {
    mysql    = "t3.small"
    backend  = "t3.micro"
    frontend = "t3.micro"
  }
}

# variable "zone_id" {
#     default = "Z0920258HFVLFKHGIGVT"
# }