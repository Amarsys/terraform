variable "project_name" {
  description = "The name of the project."
}

variable "environment" {
  description = "The environment (e.g., dev, prod)."
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
}

variable "pub_subnet_az1_cidr" {
  description = "CIDR block for the public subnet in Availability Zone 1."
}

variable "pub_subnet_az2_cidr" {
  description = "CIDR block for the public subnet in Availability Zone 2."
}

variable "prvt_app_subnet_az1_cidr" {
  description = "CIDR block for the private application subnet in Availability Zone 1."
}

variable "prvt_app_subnet_az2_cidr" {
  description = "CIDR block for the private application subnet in Availability Zone 2."
}
