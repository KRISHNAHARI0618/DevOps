output "public_ip" {
    value = aws_instance.First_EC2.public_ip
  
}
output "private_ip" {
    value = aws_instance.First_EC2.private_ip
  
}