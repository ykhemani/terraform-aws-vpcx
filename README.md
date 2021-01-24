# terraform-aws-vpc

This Terraform configuration uses the [AWS VPC Terraform module](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest) to provision a VPC.

## Required Inputs

* `tag_owner` - specifies the value for the `owner` tag used in tagging all resources generated with this Terraform configuration, as well as for naming the VPC created by this configuration.
