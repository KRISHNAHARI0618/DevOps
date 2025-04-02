
provider "aws" {
  region = "us-east-1"
}
module "cloud" {
  source  = "app.terraform.io/DevOps2024/cloud/aws"
  version = "1.0.0"
}

