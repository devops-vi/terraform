resource "aws_security_group" "allow_all_terraform" {
    name = var.sg_name
    description = var.sg_description
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        }
    ingress {
        from_port = var.ingress_from_port
        to_port = var.ingress_to_port
        protocol = var.protocol
        cidr_blocks = var.ingress_cidr
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_all_terraform"
    }
}

resource "aws_instance" "terraform_var" {
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.allow_all_terraform.id]
    tags = var.tags
}
# resource "aws_vpc_security_group_ingress_rule" "allow_all_terrafrom_ipv4" {
#   security_group_id = aws_security_group.allow_all_terrafrom.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_all_terrafrom_ipv6" {
#   security_group_id = aws_security_group.allow_all_terrafrom.id
#   cidr_ipv6         = aws_vpc.main.ipv6_cidr_block
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.allow_all_terrafrom.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }

# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
#   security_group_id = aws_security_group.allow_all_terrafrom.id
#   cidr_ipv6         = "::/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }