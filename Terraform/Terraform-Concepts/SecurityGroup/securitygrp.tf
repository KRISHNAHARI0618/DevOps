resource "aws_security_group" "sg_name" {
    description = "Allow for all users"
    name = "DevOps_All"

  ingress {
    description      = "Allow for all users"
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DevOps_All1"
  }
}