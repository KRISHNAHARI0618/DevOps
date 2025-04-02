terraform {
  backend "s3" {
    bucket = "value"
    key = "tfvars"
    region = "value"
    dynamodb_table = "value"
    encrypt = true
  }
}