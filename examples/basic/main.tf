provider "aws" {
  region = "us-east-2"
}

module "ecs_cluster" {
  source = "../.."
  cluster_name = "cls"
  cluster_settings = [
    {
    name = "containerInsights"
    value = "enabled"
  }
  ]
  fargate_capacity_providers = [
    {
        base = null
        weight = null
        capacity_provider = "FARGATE"
    },
    {
        base = null
        weight = null
        capacity_provider = "FARGATE_SPOT"
    }
  ]
  tags   = {
    Name = "cls"
    Author      = "Leon Mwandiringa"
    Environment = "dev"
    Provisioner = "terraform"
    Region      = "us-east-2"
  }
}