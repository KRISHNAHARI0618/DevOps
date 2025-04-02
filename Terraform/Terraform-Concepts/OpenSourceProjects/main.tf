module "aws_ec2" {
  source = "terraform-aws-modules/ec2-instance/aws"
  ami = local.ami_id
  instance_type = "t2.micro"
  user_data = file("robo.sh")
#   instance_type = local.inst_type
}
