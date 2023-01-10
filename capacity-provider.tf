resource "aws_ecs_cluster_capacity_providers" "default" {
  count = length(var.fargate_capacity_providers) > 0 ? 1 : 0

  cluster_name = aws_ecs_cluster.default.name
  capacity_providers = [for k, v in var.fargate_capacity_providers : try(v.capacity_provider, k)]

  dynamic "default_capacity_provider_strategy" {
    for_each = var.fargate_capacity_providers
    iterator = strategy

    content {
      capacity_provider = try(strategy.value.capacity_provider, strategy.key)
      base              = try(strategy.value.default_capacity_provider_strategy.base, null)
      weight            = try(strategy.value.default_capacity_provider_strategy.weight, null)
    }
  }

}