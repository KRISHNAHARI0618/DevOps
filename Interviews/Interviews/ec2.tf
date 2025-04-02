terraform {
  required_providers {
    aws = {
      version = ">=5.2.0"
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins" {
  ami = "ami-0182"
  instance_type =  "t2.micro"
  # vpc_security_group_ids =
}
