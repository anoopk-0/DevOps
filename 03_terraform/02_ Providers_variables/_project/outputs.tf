output "public-ip-address" {
  value = aws_instance.test-instance.public_ip
}