variable "region" {
  default = {
    dev  = "us-west-1"
    prod = "us-east-1"
  }

  description = "AWS region"
}
provider "aws" {
  alias = "west"
  region = "us-west-1"
}
provider "aws" {
  alias = "east"
  region = "us-east-1"
}

# provider "aws" {
#   region = var.region[terraform.workspace]
# }

resource "aws_instance" "example" {
  provider = aws.east
  count = terraform.workspace == "dev" ? 2 : 1
  ami = local.ami
  instance_type = local.instance_type
}
