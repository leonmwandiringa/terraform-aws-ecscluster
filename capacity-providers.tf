resource "aws_ecs_cluster_capacity_providers" "default" {
  cluster_name = aws_ecs_cluster.default.name
  capacity_providers = var.auto_scaling_group_arn == null ? var.fargate_capacity_providers : [aws_ecs_capacity_provider.default[0].name]

  dynamic "default_capacity_provider_strategy" {
    for_each = var.auto_scaling_group_arn != null ? [1] : []
    content {
      capacity_provider = aws_ecs_capacity_provider.default[0].name
      base              = var.default_capacity_provider_strategy.base
      weight            = var.default_capacity_provider_strategy.weight
    }
  }

}