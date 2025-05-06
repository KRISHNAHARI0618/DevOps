terraform {
    required_providers {
        aws = {
            version>="5.0"
            source="hashicorp/aws"
        }
    }
    backend "s3" {
    }
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "name1" {
    
    ami = "ami_01"
    depends_on = [ aws_vpc.vpc_name,aws_security_group.sg_1 ]
    vpc_security_group_ids = 
    key_name = aws_key_pair.kp1
    tags = {
        name = "instance1"
    }
}

resource "aws_security_group" "sg_1" {
    ingress = [ "0.0.0.0/0" ]
    egress = ["0.0.0.0/0"]
  
}

resource "aws_key_pair" "kp1" {
    public_key = file("/path/tofile")
    
}

resource "aws_vpc" "vpc_name" {
    id = "aws_vpc"
    cidr_block = ["172.10.0.0/27"]
  
}

resource "aws_subnet" "subnet1" {
    vpc_id =  aws_vpc.vpc_name.id
    cidr_block = ["172.10.0.1/27"]
}




