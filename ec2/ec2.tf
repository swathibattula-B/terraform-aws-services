resource "aws_instance" "my_ec2"{
  ami = ""
  instance_type="t3.micro"
  description ="terraform"  #this is aws account
  vpc_security_group_id=[aws_security_group.sg.id]

}

tags ={
  name = "myec2"
  project="roboshop"
  env="dev"
}

resource "aws_security_group" "sg"{
  name="terraform_sg"
  description="allow all terraform ports"

}

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


tags ={
  name=sg
  project=roboshop
  env=dev
}