provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./vpc"

  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "internet_gateway" {
  description = "The ID of the Internet Gateway."
  value       = module.vpc.internet_gateway_id
}
