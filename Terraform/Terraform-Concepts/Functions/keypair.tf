resource "aws_key_pair" "deployer" {
  key_name   = "DevOps_Key"
  public_key = file("${path.module}/DevOps.pub")
}