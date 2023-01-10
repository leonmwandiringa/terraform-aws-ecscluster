variable "tags" {
    type = object({
        Name = string
        Author      = string
        Environment = string
        Provisioner = string
        Region      = string
    })
    description = "ecs cluster tags"
}

variable "cluster_settings" {
    type = list(object({
        name = string
        value = string
    }))
    description = "ecs cluster settings"
}

variable "cluster_name" {
    type = string
    description = "ecs cluster name"
}

variable "fargate_capacity_providers" {
  type = list(object({
    base = number
    weight = number
    capacity_provider = string
  }))
  description = "fargate types capacity provider"
}