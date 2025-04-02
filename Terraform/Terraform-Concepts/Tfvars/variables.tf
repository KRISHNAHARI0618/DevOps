variable "ami_id"{
    type = string
    default = "ami-03265a0778a880afb"
}
variable "inst_type"{
    type = string
    default = "t2.micro"
}
variable "inst_name" {
    type = string
    default = "mongodb"
}
variable "domain" {
    type = string
    default = "haridevopsprcatice.online"
}
variable "zone_id"{
    type = string
    default = "Z0036310835V46R363UD"
}
variable "tags" {
    type = map
    default = {
    Name = "roboshop"
    }  
}
variable "sg_name"{
    type = string
    default = "allow-all-tcp"
}
variable "cidr_range" {
    type = list
    default = ["0.0.0.0/0"]
}
#This will represent the each.key and each value
variable "instances" {
    type = map
    default = {
        mongodb = "t3.medium",
        mysql = "t3.medium",
        web = "t2.micro",
        cart = "t2.micro",
        catalogue = "t2.micro",
        redis = "t2.micro",
        rabbitmq = "t2.micro",
        shipping = "t2.micro",
        payment = "t2.micro",
        user = "t2.micro"
    }
}

