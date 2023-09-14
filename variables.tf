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