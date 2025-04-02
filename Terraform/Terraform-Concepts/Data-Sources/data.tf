data "aws_vpc" "default"{
    default = true
}
output "aws_vpc" {
    value = data.aws_vpc.default 
}

data "aws_ami" "ami" {
     
}