module "ecs_cluster" {
  source = "anrim/ecs/aws//modules/cluster"
  version = "~> ${var.module_version}"

  name = var.name
  vpc_id      = var.vpc_id
  vpc_subnets = var.vpc_subnets
  tags        = var.tags
}
