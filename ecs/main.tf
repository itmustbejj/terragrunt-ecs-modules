module "ecs_cluster" {
  source  = "git@github.com:itmustbejj/terraform-aws-ecs//modules/cluster"

  name        = var.name
  vpc_id      = var.vpc_id
  vpc_subnets = var.vpc_subnets
  tags        = var.tags
}
