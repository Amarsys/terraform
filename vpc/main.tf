# VPC Configuration
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

# Use data source to get all availability zones in the region
data "aws_availability_zones" "available" {}

resource "aws_subnet" "public" {
  count                  = length(var.public_subnet_cidrs)
  vpc_id                 = aws_vpc.main.id
  cidr_block             = var.public_subnet_cidrs[count.index]
  availability_zone      = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-${var.environment}-public-subnet-${count.index + 1}"
  }
}

# Create Internet Gateway and attach it to the VPC
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}

data "aws_route_table" "public" {
  count   = length(aws_subnet.public)
  subnet_id = aws_subnet.public[count.index].id
}

resource "aws_route" "public_internet" {
  count           = length(aws_subnet.public)
  route_table_id  = data.aws_route_table.public[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id      = aws_internet_gateway.main.id
}

# Outputs
# output "vpc_id" {
# description = "The ID of the VPC."
#  value       = aws_vpc.main.id
#}

#output "public_subnet_ids" {
#  description = "List of public subnet IDs."
# value       = aws_subnet.public[*].id
#}
