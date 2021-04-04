terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.13"
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.66.0"

  name = "${var.owner}-vpc"
  cidr = var.vpc_subnet

  azs                = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets

  tags = {
    owner              = var.owner
    se-region          = var.se-region
    purpose            = var.purpose
    ttl                = var.ttl
    terraform          = "true"
    hc-internet-facing = var.hc-internet-facing
    creator            = var.creator
    customer           = var.customer
    tfe-workspace      = var.tfe-workspace
    lifecycle-action   = var.lifecycle-action
    config-as-code     = var.config-as-code
    repo               = var.repo
  }
}
