variable "region" {
  type        = string
  description = "AWS Region in which to provision this VPC."
  default = "us-west-2"
}

variable "arn_of_role_to_assume" {
  type        = string
  description = "ARN of role that Terraform will assume in order to use th AWS provider to run this Terraform code."
}

variable "owner" {
  type        = string
  description = "Label to identify owner, will be used for tagging resources that are provisioned."
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.arn_of_role_to_assume
  }
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.owner}-vpc"
  cidr = "10.0.0.0/16"

  azs                = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Owner            = var.owner
  }
}
