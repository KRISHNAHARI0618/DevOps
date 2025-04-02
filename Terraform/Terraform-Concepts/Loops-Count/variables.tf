variable "ami" {
    type = string
    default = "ami-03265a0778a880afb"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "tags" {
    type = map
    default = {
        Name = "mongodb"
        Environment = "DEV"
        terraform = "true"
        project = "DevOps"
  }
  
}
variable "sg_cidr" {
    type = list
    default = ["0.0.0.0/0"]
}
variable "instance_name"{
    type = string
    default = "mongodb"
}

variable "servers" {
    type = list
    default = [
        "mongodb",
        "catalogue",
        "cart",
        "user",
        "rabbitmq",
        "reddis",
        "mysql",
        "shipping",
        "payment",
        "web"
    ]
        
    
}