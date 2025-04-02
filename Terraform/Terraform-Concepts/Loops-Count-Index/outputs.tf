output "private_ip" {
    value = aws_instance.demo2[*].private_ip
  
}