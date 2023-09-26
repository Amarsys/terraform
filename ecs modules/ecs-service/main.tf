resource "aws_ecs_service" "ecs_service" {
  name            = var.service_name
  cluster         = var.cluster_id
  task_definition = var.ecs_task_definition_arn
  launch_type     = "FARGATE"
  desired_count   = var.desired_count


  network_configuration {
    subnets = var.subnet_ids  # Use the subnet IDs passed as an input variable
    assign_public_ip = true
  }
}