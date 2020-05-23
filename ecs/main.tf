module "ecs_cluster" {
  source  = "anrim/ecs/aws//modules/cluster"
  version = "~> 1.0.9"

  name        = var.name
  vpc_id      = var.vpc_id
  vpc_subnets = var.vpc_subnets
  tags        = var.tags
}
