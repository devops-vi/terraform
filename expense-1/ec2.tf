resource "aws_security_group" "allow_all_expense" {
    name = "allow_all_expense"
    description = "Allow port no 22 for SSH"

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
        Name = "allow_all_expense"
    }
  
}

resource "aws_instance" "expense_instance" {
    count = length(var.instance_names)
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = [aws_security_group.allow_all_expense.id]
    instance_type = var.instance_names[count.index] == "mysql" ? "t3.small" : "t3.micro"
    
    tags = {
      Name = var.instance_names
    }
}