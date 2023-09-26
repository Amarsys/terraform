variable "service_name" {
  description = "Name for the ECS service"
}

variable "cluster_id" {
  description = "ID of the ECS cluster"
}

variable "desired_count" {
  description = "Desired number of tasks"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the network configuration"
  type        = list(string)  # Specify that it's a list of strings
}

variable "assign_public_ip" {
  description = "Whether to assign a public IP to the tasks"
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = "2"  # Set a default value that matches your requirements
}

#######################################
variable "ecs_task_definition_arn" {

}

