provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "first" {
  ami = local.ami
  instance_type = local.instance_type
}