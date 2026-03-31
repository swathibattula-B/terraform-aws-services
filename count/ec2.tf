resource  "aws_instance" "my_ec2"{
  count =10
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = var.instances[count.index]
    project = "roboshop"
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
  ingress{
    from_port = 0
    to_port = 0
    protocol ="-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "TERRAFORM"

  }

  lifecycle {
    create_before_destroy = true
  }
}