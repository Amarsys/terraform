resource "aws_instance" "ec2_instances" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.public_subnets, count.index % length(var.public_subnets))
  key_name      = var.key_name

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2-${count.index}"
  }
}
