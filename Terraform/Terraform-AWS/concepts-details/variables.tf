variable "name" {
  type = string
  default = "peddireddy"
  description = "This Is First Data Element"
}
variable "ami" {
  type = string
  default = "ami-0f3c7d07486cad139"
  description = "This Is My First Machine"
}

variable "sg_cidr" {
  type = list
  default = ["0.0.0.0/0"]
  description = "This is Allowing All Values"
}

variable "instances" {
  type = map
  description = "This is For Each Instance Loop"
  default = {
    mongodb = "t3.medium"
    sql = "t3.medium"
    user = "t2.micro"
    cart = "t2.micro"
    shipping = "t2.micro"
  }
}

variable "ingress_rules" {
  type = list
  description = "This is Ingress rules"
  default = [
    {
      description = "Allow-ssh-port"
      from_port = 80
      to_port = 80
      cidr_blocks = ["0.0.0.0/0"]
      protocol = "tcp"
    },
    {
      description = "Allow-ssh-port"
      from_port = 22
      to_port = 22
      cidr_blocks = ["0.0.0.0/0"]
      protocol = "tcp"
    },
    {
      description = "Allow-ssh-port"
      from_port = 443
      to_port = 443
      cidr_blocks = ["0.0.0.0/0"]
      protocol = "tcp"
    }
  ]

}