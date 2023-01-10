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
