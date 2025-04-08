data "aws_ami_ids" "name" {
  id = aws_instance.jenkins
  owners = aws_instance.jenkins

}

provider "aws" {
  
}

resource "aws_alb" "name" {
  

dynamic "ip_configuration" {
  for_each = var.subnets
  content {
    name = "each.value.name"
    subnet_id = each.value.id
  
  }
}

}