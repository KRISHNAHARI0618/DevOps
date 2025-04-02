variable "instance_names"{
    type = list
    default = [
        "mongodb",
        "web",
        "cart",
        "catalogue",
        "reddis",
        "rabbitmq",
        "mysql",
        "shipping",
        "payment",
        "user"
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