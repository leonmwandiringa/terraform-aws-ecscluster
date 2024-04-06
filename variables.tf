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

variable "auto_scaling_group_arn" {
  type = string
  default = null
  description = "autoscaling group to attach to capacity provider"
}

variable "managed_termination_protection" {
  type = string
  default = "ENABLED"
  description = "capacity deletion protection"
}

variable "managed_scaling" {
  type = object({
    instance_warmup_period = number
    maximum_scaling_step_size = number
    minimum_scaling_step_size = number
    status = string
    target_capacity = number
  })
  default = {
    instance_warmup_period = 300
    maximum_scaling_step_size = 1000
    minimum_scaling_step_size = 1
    status = "ENABLED"
    target_capacity = 10
  }
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
  default = []
  description = "fargate types capacity provider"
}