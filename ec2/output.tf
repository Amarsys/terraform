output "ec2_instance_id" {
  description = "The ID of the EC2 instance."
  value       = aws_instance.example.id
}

output "ec2_instance_public_ip" {
  description = "The public IP address of the EC2 instance (if it has one)."
  value       = aws_instance.example.public_ip
}
