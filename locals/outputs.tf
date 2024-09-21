output "Route_53_info" {
  value = {
    for route in aws_route53_record.expense_r53 : route.name => {
      name   = route.name
      record = route.records
    }
  }
}