variable "region" {
  description = "The AWS region where the VPC will be created."
  default     = "ap-south-1"
}

variable "project_name" {
  description = "The name of the project."
  default     = "my-project"
}

variable "environment" {
  description = "The environment (e.g., dev, prod)."
  default     = "dev"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "pub_subnet_az1_cidr" {
  description = "CIDR block for the public subnet in Availability Zone 1."
  default     = "10.0.1.0/24"  # You can adjust the default value as needed.
}

variable "pub_subnet_az2_cidr" {
  description = "CIDR block for the public subnet in Availability Zone 2."
  default     = "10.0.2.0/24"  # You can adjust the default value as needed.
}

variable "prvt_app_subnet_az1_cidr" {
  description = "CIDR block for the private application subnet in Availability Zone 1."
  default     = "10.0.10.0/24"  # You can adjust the default value as needed.
}

variable "prvt_app_subnet_az2_cidr" {
  description = "CIDR block for the private application subnet in Availability Zone 2."
  default     = "10.0.11.0/24"  # You can adjust the default value as needed.
}
