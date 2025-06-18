output "instance_public_ip" {
  description = "Public IP der EC2 Instanz"
  value       = aws_instance.web.public_ip
}

output "ssh_username" {
  description = "SSH Benutzername (abhängig vom AMI)"
  value       = "ubuntu"
}
