# output "public_ip" {
#     value = [aws_instance.terraform_loop[*].public_ip]
#     sensitive = false
#     description = "This is the public ip of instance created"     
# }

# output "instance_info" {
#     value = aws_instance.terraform_loop  
# }

output "instance_details" {
  value = [
    for instance in aws_instance.terraform_loop : {
      name      = instance.tags["Name"]
      public_ip = instance.public_ip
    }
  ]
}