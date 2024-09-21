resource "aws_route53_record" "expense_r53" {
  count           = length(var.instance_names)
  type            = "A"
  ttl             = "1"
  zone_id         = var.zone_id
  name            = var.instance_names[count.index] == "frontend" ? "${var.frontend_expenseapp}.${var.domain_name}" : "${var.instance_names[count.index]}.${var.domain_name}"
  records         = var.instance_names[count.index] == "frontend" ? [aws_instance.expense_instance[count.index].public_ip] : [aws_instance.expense_instance[count.index].private_ip]
  allow_overwrite = true
}