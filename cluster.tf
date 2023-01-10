resource "aws_ecs_cluster" "default" {
  name = var.cluster_name

  dynamic "setting" {
    for_each = var.cluster_settings
    content {
      name  = setting.value["name"]
      value = setting.value["value"]
    }
  }

  tags = var.tags
}