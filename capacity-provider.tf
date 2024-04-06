resource "aws_ecs_capacity_provider" "default" {
  count = var.auto_scaling_group_arn != null ? 1 : 0
  name = "${var.cluster_name}-cp"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = var.auto_scaling_group_arn
    managed_termination_protection = var.managed_termination_protection

    managed_scaling {
      maximum_scaling_step_size = var.managed_scaling["maximum_scaling_step_size"]
      minimum_scaling_step_size = var.managed_scaling["minimum_scaling_step_size"]
      status                    = var.managed_scaling["status"]
      target_capacity           = var.managed_scaling["target_capacity"]
    }
  }
}