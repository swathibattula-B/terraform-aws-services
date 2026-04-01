variable "instances" {
    type = map
    default = {
        mongodb = t2.micro
        mysql = t3.small
        cart = t3.micro
    }
}