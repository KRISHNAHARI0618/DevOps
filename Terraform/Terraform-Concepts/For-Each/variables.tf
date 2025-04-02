variable "ami_id"{
    type = string
    default = "ami-03265a0778a880afb"
}
variable "inst_type"{
    type = string
    default = "t2.micro"
}

variable "servers"{
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
variable "inst_names"{
    default = [
        "mongodb",
        "web",
        "cart",
        "catalogue",
        "redis",
        "rabbitmq",
        "shipping",
        "user",
        "payment",
        "mysql"
    ]
}

variable "zone_id"{
    type = string
    default = "Z0036310835V46R363UD"
}
variable "domain"{
    type = string
    default = "haridevopspractice.online"
}