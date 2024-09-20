output "Instances_info" {
  value = [
    for instance in aws_instance.expense : {
      name          = instance.tags["Name"]
      public_ip     = instance.public_ip
      private_ip    = instance.private_ip
      state         = instance.instance_state
      instance_type = instance.instance_type
    }
  ]
}

output "Route_53_info" {
  value = aws_route53_record.expense_route53[*].name
}