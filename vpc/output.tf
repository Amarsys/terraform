# Exported Outputs

output "region" {
  description = "The AWS region where the VPC was created."
  value       = var.region
}

output "project_name" {
  description = "The name of the project."
  value       = var.project_name
}

output "Environment" {
  description = "The environment (e.g., dev, prod)."
  value       = var.Environment
}

output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.vpc.id
}

output "internet_gateway" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.internet_gateway.id
}

output "public_subnet_az1_id" {
  description = "The ID of the public subnet in Availability Zone 1."
  value       = aws_subnet.public_subnet_az1.id
}

output "public_subnet_az2_id" {
  description = "The ID of the public subnet in Availability Zone 2."
  value       = aws_subnet.public_subnet_az2.id
}

output "private_app_subnet_az1_id" {
  description = "The ID of the private application subnet in Availability Zone 1."
  value       = aws_subnet.private_app_subnet_az1.id
}

output "private_app_subnet_az2_id" {
  description = "The ID of the private application subnet in Availability Zone 2."
  value       = aws_subnet.private_app_subnet_az2.id
}

output "private_data_subnet_az1_id" {
  description = "The ID of the private data subnet in Availability Zone 1."
  value       = aws_subnet.private_data_subnet_az1.id
}

output "private_data_subnet_az2_id" {
  description = "The ID of the private data subnet in Availability Zone 2."
  value       = aws_subnet.private_data_subnet_az2.id
}

output "availability_zone_1" {
  description = "The name of the first availability zone."
  value       = data.aws_availability_zones.available_zones.names[0]
}

output "availability_zone_2" {
  description = "The name of the second availability zone."
  value       = data.aws_availability_zones.available_zones.names[1]
}
