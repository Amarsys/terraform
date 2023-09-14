variable "ami" {
  description = "AMI ID for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance."
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
