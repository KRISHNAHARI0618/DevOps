# Create a Iam User
resource "aws_iam_user" "hari" {
  name = var.name
  path = "/system/"
}
# Create a Instance
resource "aws_instance" "jenkins" {
  ami = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  tags = var.name == "peddireddy" ? "t2.micro" : "t3.medium"
  security_groups = [ aws_security_group.allow-all.name ]
}
resource "aws_security_group" "allow-all" {
  # vpc_id = aws_vpc.mainvpc.id
  name = "allow-all"
  description = "This is First Security Group"

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
    cidr_blocks = var.sg_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg_cidr
  }
  lifecycle {
    create_before_destroy = true
  }

}