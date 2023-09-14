output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "internet_gateway" {
  description = "The ID of the Internet Gateway."
  value       = module.vpc.internet_gateway_id
}

output "public_subnet_az1_id" {
  description = "The ID of the public subnet in Availability Zone 1."
  value       = module.vpc.public_subnet_az1_id
}

output "public_subnet_az2_id" {
  description = "The ID of the public subnet in Availability Zone 2."
  value       = module.vpc.public_subnet_az2_id
}

output "private_app_subnet_az1_id" {
  description = "The ID of the private application subnet in Availability Zone 1."
  value       = module.vpc.private_app_subnet_az1_id
}

output "private_app_subnet_az2_id" {
  description = "The ID of the private application subnet in Availability Zone 2."
  value       = module.vpc.private_app_subnet_az2_id
}
