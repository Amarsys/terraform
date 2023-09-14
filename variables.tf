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
