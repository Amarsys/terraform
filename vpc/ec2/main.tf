# Set the AWS provider
provider "aws" {
  region = var.region
}

# Reference the VPC and subnet created in the VPC module
data "aws_vpc" "vpc" {
  id = module.vpc.vpc_id
}

data "aws_subnet" "public_subnet" {
  id = module.vpc.public_subnet_az1_id
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0f5ee92e2d63afc18"  # Replace with your desired AMI ID
  instance_type = "t2.micro"      # Replace with your desired instance type
  subnet_id     = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = []      # Add your security group IDs here if needed

  tags = {
    Name = "${var.project_name}-${var.Environment}-ec2"
  }
}
