variable "name" {
    type = string
    default = "swathi"
}

variable "environment" {
    type = string
    default = "dev"
}

/* variable "instance_name" {
    type = string
    default = "${var.name}-${var.environemt}"
} */



variable "ec2_tags" {
    default = {
        Name = "local-demo"
        Environment = "prod"
    }
}

variable "sg_tags" {
    default = {
        Name = "local-demo"
    }
}