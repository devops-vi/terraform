output "public_ip" {
    value = aws_instance.terraform_loop[count.index].public_ip
  
}