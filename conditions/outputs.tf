output "public_ip" {
    value = aws_instance.terraform.public_ip
    sensitive = false
    description = "This is the public ip of instance created"     
}

output "security_group_id" {
    value = aws_security_group.allow_all_conditions_tf.id
    sensitive = false
    description = "This is the security group id"
  
}