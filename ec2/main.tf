resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(module.vpc.public_subnet_ids, 0)  # Assuming you want to use the first public subnet

  tags = {
    Name = "${var.project_name}-${var.environment}-ec2"
  }
}
