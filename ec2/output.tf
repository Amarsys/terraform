output "ec2_instance_ids" {
  description = "List of EC2 instance IDs created by the module."
  value       = aws_instance.ec2_instances[*].id
}
