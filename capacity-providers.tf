resource "aws_ecs_cluster_capacity_providers" "default" {
  count = length(var.fargate_capacity_providers) > 0 ? 1 : 0

  cluster_name = aws_ecs_cluster.default.name
  capacity_providers = length(var.fargate_capacity_providers) > 0 ? var.fargate_capacity_providers : aws_ecs_capacity_provider.default[0].name

  dynamic "default_capacity_provider_strategy" {
    for_each = var.fargate_capacity_providers
    content {
      capacity_provider = fargate_capacity_providers.value
      base              = default_capacity_provider_strategy.base
      weight            = strategy.value.default_capacity_provider_strategy.weight
    }
  }

}