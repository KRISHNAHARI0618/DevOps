locals {
  value = aws_instance.jenkins.public_ip
}

# It has Extra Capabilities like it can run expressions and Functions