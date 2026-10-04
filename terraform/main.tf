locals {
  name_prefix = "ecommerce-${var.environment}"
}

module "networking" {
  source = "./modules/networking"

  project_name = "ecommerce"
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "security" {
  source = "./modules/security"

  project_name = "ecommerce"
  environment  = var.environment

  vpc_id = module.networking.vpc_id
}

module "iam" {
  source = "./modules/iam"

  project_name = "ecommerce"
  environment  = var.environment
}

module "compute" {
  source = "./modules/compute"

  project_name = "ecommerce"
  environment  = var.environment
  aws_region   = var.aws_region

  vpc_id = module.networking.vpc_id

  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids

  alb_security_group_id = module.security.alb_security_group_id
  ecs_security_group_id = module.security.ecs_security_group_id

  ecs_task_execution_role_arn = module.iam.ecs_task_execution_role_arn
  ecs_task_role_arn           = module.iam.ecs_task_role_arn
}

module "github_oidc" {
  source = "./modules/github-oidc"

  project_name = "ecommerce"

  github_repository = "iampratik11/infra-as-code-pipeline"

  environment = var.environment

  aws_region = var.aws_region
}
