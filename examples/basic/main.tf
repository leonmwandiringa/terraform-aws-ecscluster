provider "aws" {
  region = "us-east-2"
}

module "ecs_cluster" {
  source = "../.."
  cluster_name = "testo"
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
    Name = "testo1"
    Author      = "aut1"
    Environment = "env1"
    Provisioner = "terraform"
    Region      = "us-east-2"
  }
}