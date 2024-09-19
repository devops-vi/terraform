resource "aws_security_group" "allow_all_loops_tf" {
    name = "allow_all_loops_tf"
    description = "Allow port 22 from all"

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
        Name = "allow_all_loops_tf"
    }
  
}

resource "aws_instance" "terraform_loop" {
    count = length(var.instance_names)
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all_loops_tf.id]
    tags = {
      Name = var.instance_names[count.index]
    }
  
}