# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "MyVPC"
  }
}

# IAM Role
resource "aws_iam_role" "my_role" {
  name = "MyEC2Role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# CloudTrail
resource "aws_cloudtrail" "my_cloudtrail" {
  name          = "MyCloudTrail"
  s3_bucket_name = aws_s3_bucket.my_bucket.bucket

  event_selector {
    read_write_type = "All"
    include_management_events = true
    data_resource {
      type = "AWS::S3::Object"
      values = ["arn:aws:s3:::${aws_s3_bucket.my_bucket.bucket}/*"]
    }
  }
}

# EC2 Instance
resource "aws_instance" "my_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.my_security_group.id]

  iam_instance_profile = aws_iam_instance_profile.my_instance_profile.name

  tags = {
    Name = "MyEC2Instance"
  }
}

# S3 Bucket (used by CloudTrail)
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-terraform-bucket"
  acl    = "private"
}

# IAM Instance Profile (used by EC2)
resource "aws_iam_instance_profile" "my_instance_profile" {
  name = "MyInstanceProfile"
  role = aws_iam_role.my_role.name
}

# Security Group (used by EC2)
resource "aws_security_group" "my_security_group" {
  name        = "MySecurityGroup"
  description = "Allow inbound SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Subnet (assumes VPC is in us-east-1)
resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}
