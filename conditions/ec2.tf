resource  "aws_instance" "my_ec2" {
  ami = var.ami_id
  instance_type = var.environment == "dev" ? "t2.micro" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "sg"{
  name = var.sg_name
  description = var.sg_discpription
  
  egress {
    
    from_port = var.sg_from_port
    to_port = var.sg_to_port
    protocol ="-1"
    cidr_blocks = var.sg_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]

  }
  ingress {
    from_port = var.sg_from_port
    to_port = var.sg_to_port
    protocol ="-1"
    cidr_blocks = var.sg_cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.sg_tags

  

  lifecycle {
    create_before_destroy = true
  }
}
