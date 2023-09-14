# Environment variables
variable "region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "my-project"
}

variable "Environment" {
  default = "dev"
}

# VPC variables
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "pub_subnet_az1_cidr" {
  default = "10.0.1.0/24"
}

variable "pub_subnet_az2_cidr" {
  default = "10.0.2.0/24"
}

variable "prvt_app_subnet_az1_cidr" {
  default = "10.0.10.0/24"
}

variable "prvt_app_subnet_az2_cidr" {
  default = "10.0.11.0/24"
}

variable "prvt_data_subnet_az1_cidr" {
  default = "10.0.20.0/24"
}

variable "prvt_data_subnet_az2_cidr" {
  default = "10.0.21.0/24"
}
