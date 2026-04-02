resource  "aws_instance" "my_ec2"{
  ami = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory.ini"
  }

  provisioner "local-exec" {
    command = "exit 1"
    on_failure = continue
    
  }

  provisioner "local-exec" {
    command = "echo script-2"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Deleting the instance'"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "echo > inventory.ini"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = self.public_ip
  }


  provisioner "remote-exec" {
    inline = [
      " sudo  yum install  nginx -y",
      " sudo systemctl start nginx",
    ]
  }


  tags = {
    Name = "provisioner-demo"
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