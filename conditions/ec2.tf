resource "aws_instance" "terraform" {
  ami = var.ami_id
  instance_type = var.environment == "prod" ? "t3.micro" : "t3.small"
  vpc_security_group_ids = [aws_security_group.allow_all_conditions_tf.id]

  tags = {
    Name = "terraform"
  }
}

resource "aws_security_group" "allow_all_conditions_tf" {
    name = "allow_all_conditions_tf"
    description = "All SSH from all ports"

    egress {
        to_port = 0
        from_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = var.ipv6_cidr_blocks

    }
    ingress {
        from_port = var.ingress_from_port
        to_port = var.ingress_to_port
        protocol = var.ingress_protocol
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = var.ipv6_cidr_blocks

    }

    tags = {

    }
}