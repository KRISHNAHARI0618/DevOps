variable "ami" {
  type = string
  # default = "ami-0f3c7d07486cad139"
  # description = "This is Default AMI Id for instances"
}
variable "instance_type" {
  type = string
  # default = "t2.micro"
  # description = "this is default machine type"
}

variable "tags" {
  type = string
  # default = "peddireddy"
  # description = "this is default instances name"

}