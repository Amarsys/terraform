output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.vpc.id
}

output "internet_gateway" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.internet_gateway.id
}
