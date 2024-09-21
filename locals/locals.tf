locals {
  domain_name = "laven.cloud"
  zone_id = "Z0920258HFVLFKHGIGVT"
  instance_type = var.env == "prod" ? "t3.medium" : "t3.micro"
}