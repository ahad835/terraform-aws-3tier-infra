output "public_ip" {
  value = aws_instance.frontend.public_ip
}

output "public_dns" {
  value = aws_instance.frontend.public_dns
}
output "frontend_sg_id" {
  value = aws_security_group.frontend_sg.id
}
