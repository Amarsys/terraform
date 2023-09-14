resource "aws_instance" "ec2_instances" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(aws_subnet.public_subnets[*].id, count.index % length(aws_subnet.public_subnets))
  key_name      = var.key_name

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2-${count.index}"
  }
}

output "ec2_instance_ids" {
  description = "List of EC2 instance IDs created by the module."
  value       = aws_instance.ec2_instances[*].id
}