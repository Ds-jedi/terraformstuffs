output "public-ip" {
    value       = aws_instance.firstec2.public_ip
}


output "private-ip" {
    value       = aws_instance.firstec2.private_ip
}