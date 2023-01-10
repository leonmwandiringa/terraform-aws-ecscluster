# AWS ECS Terraform module

Terraform module built for Vodacom internal use by the Vodasure team.

ECS configurations includes:

- Cluster creation
- Cluster Settings
- Capacity Provider
- Provider profile creation

## Basic Usage

```hcl
module "ecs" {
  source = "leonvodacom/ecscluster"
  cluster_name = "ecscluster-test"
  cluster_settings = var.cluster_settings
  fargate_capacity_providers = var.fargate_capacity_providers
  tags   = var.global_tags
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 4.0.0 |

## Modules

No Modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| tags | (Required) module global tags. | `map(any)` | `null` | yes |
| cluster_name | (Required) ECS cluster name. | `string` | `null` | yes |
| cluster_settings | (Optional) a list map of ecs setting to enable. | `list(object({name = string, value = string}))` | `null` | no |
| fargate_capacity_providers | (Optional) Fargates provider configuration. | `list(object({base = number, weight = number, capacity_provider = string}))` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_id | ECS Cluster ID. |
| cluster\_name | Name of ECS Cluster created. |
| cluster\_arn | ARN of cluster created. |

## Authors

Module authored and managed by [Leon_Mwandiringa](https://github.com/techadontech) from the [Vodasure Team].

## License

Apache 2 Licensed. See LICENSE for full details.