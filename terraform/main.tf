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
