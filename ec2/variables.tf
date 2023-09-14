variable "project_name" {
  description = "The name of the project."
}

variable "environment" {
  description = "The environment (e.g., dev, prod)."
}

variable "instance_count" {
  description = "Number of EC2 instances to create."
  type        = number
  default     = 1  # Adjust the default count as needed.
}

variable "ami_id" {
  description = "ami-0f5ee92e2d63afc18"
}

variable "instance_type" {
  description = "The EC2 instance type."
  default     = "t2.micro"  # Adjust the default instance type as needed.
}

variable "key_name" {
  description = "Sam"
}

variable "public_subnets" {
  description = "List of public subnets for EC2 instances."
  type        = list(object({
    id = string
  }))
}
