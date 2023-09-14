variable "project_name" {
  description = "Name of the project."
  type        = string
  default     = "my-project"  # You can specify a default value
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "region" {
  description = "AWS region where resources will be created."
  type        = string
  default     = "ap-south-1"  # Specify your desired AWS region
}
