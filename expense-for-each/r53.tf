resource "aws_route53_record" "for_each_r53" {
  for_each        = aws_instance.expense
  zone_id         = local.zone_id
  name            = each.key == "frontend" ? "${local.frontend}.${local.domain_name}" : "${each.key}.${local.domain_name}"
  ttl             = 1
  type            = "A"
  records         = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true


}