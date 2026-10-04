terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket               = "infra-as-code-pipeline-terraform-state"
    key                  = "terraform.tfstate"
    region               = "us-east-2"
    encrypt              = true
    dynamodb_table       = "infra-as-code-pipeline-terraform-lock"
    workspace_key_prefix = "environments"
  }
}
