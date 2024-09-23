resource "aws_security_group" "allow_ports" {
    name = "allow_ports"
    description = "allow port 22, 80,8080"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
          from_port = ingress.value["from_port"]
          to_port = ingress.value["to_port"]
          protocol = ingress.value["protocol"]
          cidr_blocks = ingress.value.cidr_blocks
        }
    }

    tags = {
      Name = "allow_ports"
    }
  
}

resource "aws_instance" "terraform" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ports.id]
    tags = {
      Name = "terraform"
    }

    provisioner "local-exec" {
        command = "echo ${self.private_ip} > private_ip.txt"
      
    }

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }
    provisioner "remote-exec" {
      inline = [ 
        "sudo dnf install ansible -y",
        "sudo dnf install nginx -y",
        "sudo systemctl start nginx"
       ]      
    }
    provisioner "remote-exec" {
      when = destroy
      inline = [ 
        "sudo systemctl stop nginx"
       ]
      
    }


  
}