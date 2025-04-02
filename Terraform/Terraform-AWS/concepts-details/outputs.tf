output "ip_address" {
  value = aws_instance.jenkins.public_ip
}