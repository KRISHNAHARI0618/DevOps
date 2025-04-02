resource "aws_instance" "First_EC2" {
    ami = var.ami
    instance_type = var.instance_type
    tags = var.tags
}