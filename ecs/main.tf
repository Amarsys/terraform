resource "aws_ecs_cluster" "my_cluster" {
  name = "${var.project_name}-${var.environment}-ecs-cluster"
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  value       = aws_ecs_cluster.my_cluster.name
}
