resource "aws_instance" "roboshop" {
    ami = var.ami_id
    instance_type = var.inst_type
}