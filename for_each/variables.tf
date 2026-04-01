/* variable "instances" {
    type = map
    default = {
         mongodb = "t3.micro"
        mysql = "t3.small"
        user = "t3.micro"
        shipping = "t3.small"
    }
}  */

variable "instances" {
    type = list
    default = ["mongodb", "redis"]
}


variable "zone_id" {
    default = "Z0948038R41NQZKQH925"
}

variable "domain_name" {
    default = "daws88ss.online"
}