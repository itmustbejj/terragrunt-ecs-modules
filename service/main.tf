resource "aws_ecs_task_definition" "app" {
  family = "app-dev"
  container_definitions = <<EOF
[
  {
    "name": var.container_name,
    "image": var.container_image,
    "essential": var.essential,
    "portMappings": [
      {
        "containerPort": var.container_port
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "app-dev-nginx",
        "awslogs-region": "us-east-1"
      }
    },
    "memory": var.container_memory,
    "cpu": var.container_cpu
  }
]
EOF
}

module "ecs_service_app" {
  source = "anrim/ecs/aws//modules/service"
  version = "~> ${var.module_version}}"

  name = var.name

  alb_target_group_arn = module.alb.target_group_arn
  cluster              = module.ecs_cluster.cluster_id
  container_name       = var.container_name
  container_port       = var.container_port
  log_groups           = ["app-dev-nginx"]
  task_definition_arn  = aws_ecs_task_definition.app.arn

  tags = var.tags
}
