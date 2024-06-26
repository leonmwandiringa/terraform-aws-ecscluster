# AWS listebner-tg Terraform module

listener-tg configurations includes:

- Cluster creation
- Cluster Settings
- Capacity Provider
- Provider profile creation

## Basic Usage

```hcl
module "listebner-tg" {
  source = "git@github.com:leonmwandiringa/terraform-aws-listener-tg?ref=v1.0"
  cluster_name = "cls"
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
| cluster_name | (Required) listebner-tg cluster name. | `string` | `null` | yes |
| cluster_settings | (Optional) a list map of listebner-tg setting to enable. | `list(object({name = string, value = string}))` | `null` | no |
| fargate_capacity_providers | (Optional) Fargates provider configuration. | `list(object({base = number, weight = number, capacity_provider = string}))` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_id | listebner-tg Cluster ID. |
| cluster\_name | Name of listebner-tg Cluster created. |
| cluster\_arn | ARN of cluster created. |

## Authors

Module authored and managed by [Leon_Mwandiringa](https://github.com/leonmwandiringa).

## License

Apache 2 Licensed. See LICENSE for full details.