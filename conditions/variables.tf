variable "environment" {
    default = "dev"
}

variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "RHEL image "

}

variable "instance_type" {
    type = string
    default = "t3.micro"

}
variable "ec2_tags" {
    type = map
    default = {
        Name = "swathi"
        project = "robooshop"
        env = "dev"

    }

} 

variable "sg_name" {
    type = string 
    default = "allow-all-terraform"
}

variable "sg_discpription"{
    type = string 
    default =  "all_all_ports"
}

variable "sg_from_port" {
    type = number
    default = 0
}

variable "sg_to_port" {
    type = number
    default = 0 
}

variable "sg_cidr_blocks" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "sg_tags" {
    type = map 
    default = {
        Name = "TERRAFORM"
        env = "dev"

    }
}