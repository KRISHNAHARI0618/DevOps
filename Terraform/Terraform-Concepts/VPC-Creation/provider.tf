terraform {
  required_providers {
    aws =  {
        source = "hashicorp/aws"
        version = "5.22.0"
    }
  }
  backend "s3" {
    bucket = "hariroboshop"
    key = "vpc-module"
    region = "us-east-1"
    dynamodb_table = "roboshoptable"
  }
}
provider "aws" {
    region = "us-east-1"
}