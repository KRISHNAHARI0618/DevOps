terraform {
  backend "s3" {
    bucket = "value"
    key = ""
    region = "value"
    dynamodb_table = "value"
    encrypt = true

  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}