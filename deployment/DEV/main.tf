# --- deployment/DEV/instance/main.tf ---

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source            = "../../modules/DEV/vpc"
  az                = var.az
  vpc_cidr_block    = var.vpc_cidr_block
  subnet_cidr_block = var.subnet_cidr_block
}

module "instance" {
  source        = "../../modules/DEV/instance"
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
}