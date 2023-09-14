variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "project_name" {
  description = "Name of the project."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}
