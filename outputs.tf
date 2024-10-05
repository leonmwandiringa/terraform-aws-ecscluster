output "cluster_id" {
  description = "ECS cluster id"
  value       = aws_ecs_cluster.default.id
}

output "cluster_name" {
  description = "ECS cluster arn"
  value       = aws_ecs_cluster.default.name
}

output "cluster_arn" {
  description = "ECS cluster arn"
  value       = aws_ecs_cluster.default.arn
}

output "ec2_capacity_provider_name" {
  description = "capacity provider name"
  value       = var.auto_scaling_group_arn == null ? "" : aws_ecs_capacity_provider.default[0].name
}