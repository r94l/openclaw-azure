output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.clawdthebutler.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.clawdthebutler.public_dns
}

output "ssh_command" {
  description = "Command to SSH into your EC2 instance"
  value       = "ssh -i ${var.key_pair_name}.pem ubuntu@${aws_instance.clawdthebutler.public_ip}"
}