resource "aws_security_group" "expense_allow" {
    name = "expense_allow"
    description = "Allow port 22 for SSH"

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
        Name = "expense_allow"
    }
}

resource "aws_instance" "expense_instance" {
    #name = "expense_instance"
    ami = data.aws_ami.devops_practice.id
    vpc_security_group_ids = [aws_security_group.expense_allow.id]
    instance_type = "t3.micro"

    tags = {
        Name = "expense_instance"
    }  
}

# resource "aws_route53_record" "expense_route53" {
#     name = 
#     zone_id = ""
#     ttl = 1
#     type "A"
#     records = aws_instance.expense_instance.private_ip
  
# }