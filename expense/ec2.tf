resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.expense_allow_all.id]
    instance_type = "t3.micro"

    tags = merge(
        var.common_tags,
        {
            Name = var.instance_names[count.index]
        }
    )
}

resource "aws_security_group" "expense_allow_all" {
    name = "expense_allow_all"
    description = "Allowing port 22 for SSH access"

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

    tags = merge(
        var.common_tags,
        {
            Name = "expense_allow_all"
        }
    )

}