terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.22.0"
    }
  }
  backend "s3" {
    bucket = "hariroboshop"
    key = "VpcModule"
    dynamodb_table = "roboshoptable"
    region = "us-east-1"
  }
}
provider "aws" {
    region = "us-east-1"
}