resource "aws_instance" "ec2" {
    ami = local.ami_id
    instance_type = local.inst_type
    tags = local.tags
}