provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"

  project_name            = var.project_name
  environment             = var.environment
  vpc_cidr                = var.vpc_cidr
  pub_subnet_az1_cidr     = var.pub_subnet_az1_cidr
  pub_subnet_az2_cidr     = var.pub_subnet_az2_cidr
  prvt_app_subnet_az1_cidr = var.prvt_app_subnet_az1_cidr
  prvt_app_subnet_az2_cidr = var.prvt_app_subnet_az2_cidr
}

module "ec2" {
  source = "./ec2"

  project_name    = var.project_name
  environment     = var.environment
  instance_count  = 1  # Adjust the number of instances as needed.
  ami_id          = "ami-0f5ee92e2d63afc18"
  instance_type   = "t2.micro"  # Adjust the instance type as needed.
  key_name        = "Sam"
  public_subnets  = aws_subnet.public_subnets
}


output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "internet_gateway" {
  description = "The ID of the Internet Gateway."
  value       = module.vpc.internet_gateway_id
}
