resource "aws_security_group" "expense_sg" {
  #for_each = var.instance_names
  name        = "expense_sg"
  description = "Allow port for SSH. port 22"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "aws_instance" "expense" {
  for_each               = var.instance_names
  vpc_security_group_ids = [aws_security_group.expense_sg.id]
  ami                    = data.aws_ami.ami_info.id
  instance_type          = each.value

  tags = {
    Name = each.key
  }
}