resource "aws_route53_record" "expense_route53" {
  count   = length(var.instance_names)
  zone_id = var.zone_id
  type    = "A"
  name    = "${var.instance_names[count.index]}.${var.domain}"
  records = [aws_instance.expense[count.index].private_ip]
}