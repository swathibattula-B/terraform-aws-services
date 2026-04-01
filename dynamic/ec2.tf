resource  "aws_instance" "my_ec2"{
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "swathi"
    project = "robooshop"
  }
}

resource "aws_security_group" "sg"{
  name = "allow-all-terraform"
  description = "all_all_ports"
  
  egress {
    
    from_port = 0
    to_port = 0
    protocol ="-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]

  }
  dynamic "ingress" {
    for_each = toset(var.ingress_rules)
    content {
    from_port = ingress.value.port
    to_port = ingress.value.port
    protocol = "tcp"
    cidr_blocks = ingress.value.cidr_blocks
    description =ingress.value.description
    }
  }
  tags = {
    Name = "TERRAFORM"

  }

  lifecycle {
    create_before_destroy = true
  }
}