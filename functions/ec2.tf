resource "aws_instace" "functions_tf" {
    count = length(var.instance_names)
    ami = var.ami_id
    instace_type = "t3.micro"
    vpc_security_group_id = [aws_security_group.allow_all_function.id]

    tags = merge(
        var.common_tags,
        { Name = var.instance_names[count.index] }
    )
}

resource "aws_security_group" "allow_all_function" {
    name = "allow_all_function"
    description = "Allow SSH from port 22"

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
            Name = "allow_all_function"
        }
    )
  
}