variable "split" {
  default =  "apple,banana,orange"
}
variable "fruits" {
  default = "apple,banana,orange"
}

locals {
  fruit_list = split(",", var.fruits)
}

output "first_fruit" {
  value = local.fruit_list[0]
}

# resource "aws_instance" "split_server" {
#   ami = local.ami
#   instance_type = local.instance_type
# }