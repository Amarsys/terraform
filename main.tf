module "vpc" {
  source               = "./vpc"
  vpc_cidr             = "10.0.0.0/16"
  project_name         = "my-project"
  environment          = "dev"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]  # Add more as needed
}

module "ec2_instance" {
  source       = "./ec2"
  ami          = "ami-0f5ee92e2d63afc18"  # Replace with your desired AMI ID
  instance_type = "t2.micro"      # Replace with your desired instance type
  project_name = "my-project"
  environment  = "dev"
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance."
  value       = module.ec2_instance.instance_id
}