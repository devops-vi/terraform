resource "aws_security_group" "allow_all_terraform" {
    name = "allow_all_terraform"
    description = "This is to create security group that should be used while creating the aws instance"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Name = "allow_all_terraform"
    }
}

resource "aws_instance" "terraform_var" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all_terraform.id]
    tags = {
        Name = "terraform_vars"
    }
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