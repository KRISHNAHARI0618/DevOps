resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "roboshop"
      terraform = "true"
      project = "roboshop-pro"
      environment = "DEV"
    }
}