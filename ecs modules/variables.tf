variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision"
  default     = "1024"  # Set a default value that matches your requirements
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"  # Set a default value that matches your requirements
}

variable "app_image" {
  description = "Docker image to run in this ECS task"
  default     = "nginx:latest"  # Set a default Docker image
}

variable "app_port" {
  description = "Port exposed on the Docker image"
  default     = "80"  # Set a default port
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = "2"  # Set a default value that matches your requirements
}
