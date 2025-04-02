provider "aws" {
  region = "us-east-1"
}

locals {
  ami = "ami-0f3c7d07486cad139"
}
locals {
  instance_type = "t2.micro"
}
resource "aws_instance" "first_instance" {
  ami = local.ami
  instance_type = local.instance_type
}