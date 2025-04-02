# Creating Resource Moduel VPC 
module "vpc" {
    source = "../Module-Developer"
    project_name = var.project_name
    cidr_block = var.cidr_block
    common_tags = var.common_tags
}