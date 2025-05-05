resource "aws_instance" "name1" {
  ami      = "ami-id"
  key_name = "private.key"
  tags = {
    name : "devops"
    region : "eastus2"
  }
}

terraform {
  required_providers {
    aws = {
      version = "6.34.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "us-eastus-2"
  access_key = ""
  secret_key = ""

}
data "aws_ami" "name" {
  owners      = [users]
  most_recent = true
  filter {
    name   = "name"
    values = ["ami-id*1-923"]
  }
}

variable "aws_instances" {
  type = map(string)
}

resource "aws_instance" "name" {
  dynamic "variables_calling" {
    for_each = each.key
    content {
      key   = each.key
      value = each.value
    }
    aws_instance = each.key == "web" ? "aws_instance" : "aws_instance2"
  }
}

resource "aws_instance" "name" {

  count = 0


}
resource "aws_instance" "name" {
  for_each = var.aws_instances
  tags = {
    "key"   = each.key
    "value" = each.value
  }
  lifecycle {
    replace_triggered_by = []
    ignore_changes       = []
    prevent_destroy      = false
    precondition { bcondition = "sdsd" }
    create_before_destroy = false

  }
}
output "ami" {
  value = "aws_instance.id"
}
data "" "name" {
  
}
locals {
  ami = "ami_id"
}