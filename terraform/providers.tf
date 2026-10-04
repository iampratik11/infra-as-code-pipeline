provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "infra-as-code-pipeline"
      ManagedBy   = "Terraform"
      Environment = var.environment
    }
  }
}
