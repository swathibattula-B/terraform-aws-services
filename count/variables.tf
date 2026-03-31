variable "instances" {
    type = list
    default = ["mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
}

variable "zone_id" {
    default = "Z0948038R41NQZKQH925"

}

variable  "domain_name" {
    default="daws88ss.online"
}



variable "fruits" {
    type = list(string)
    default = ["apple", "banana", "apple", "orange"]
}

variable "fruits_set" {
    type = set(string)
    default = ["apple", "banana", "apple", "orange"]
}

variable "names" {
    type = set(string)
    default = ["swathi", "sravai", "sai", "akka"]
}