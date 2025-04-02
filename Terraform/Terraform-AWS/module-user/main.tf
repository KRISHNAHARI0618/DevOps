module "ec2" {
  source = "../module-create"
  ami = var.ami_id
  instance_type = var.instance_type
  tags = var.tags
}