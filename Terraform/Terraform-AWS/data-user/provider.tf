# terraform {
#   required_providers {

#   }
# }

provider "aws" {
  region = "us-east-1"
}

data "aws_kms_key" "example" {
  key_id = "arn:aws:kms:us-east-1:901746482618:key/98ac4a6c-8396-4659-a5a4-2c8dd2d97542"
}

output "key_id" {
  value = data.aws_kms_key.example.creation_date
}