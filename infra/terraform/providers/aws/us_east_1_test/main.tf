variable "env" {}
variable "prefix" {}
variable "common_tags" {}
variable "region" {}
variable "region_abbr" {}
variable "account_id" {}
variable "codebuild_deployment_role" {}
variable "codebuild_service_role" {}

terraform {
  required_version = ">= 0.12.0"
  backend "s3" {
    bucket  = "mgcp-test-terraform-us-east-1"
    key     = "backend/state"
    region  = "us-east-1"
    profile = "mgcp-test"
  }
}
provider "aws" {
  version = "~> 2.0"
  region  = "${var.region}"
  profile = "mgcp-test"
}

module "codebuild_deployment_role" {
  source                    = "../../../modules/aws/codebuild/deployment_role"
  env                       = "${var.env}"
  prefix                    = "${var.prefix}"
  common_tags               = "${var.common_tags}"
  region                    = "${var.region}"
  description               = "Deploy role for codebuild"
  codebuild_service_role    = "${var.codebuild_service_role}"
  account_id                = "${var.account_id}"
  codebuild_deployment_role = "${var.codebuild_deployment_role}"
}

# module "network" {
#   source = "../../../modules/aws/network"

#   prefix      = "${var.prefix}"
#   common_tags = "${var.common_tags}"
#   region      = "${var.region}"
#   cidr        = "${var.cidr}"
#   #vpc
#   azs                          = "${var.azs}"
#   private_subnets              = "${var.private_subnets}"
#   public_subnets               = "${var.public_subnets}"
#   public_subnet_ipv6_prefixes  = "${var.public_subnet_ipv6_prefixes}"
#   private_subnet_ipv6_prefixes = "${var.private_subnet_ipv6_prefixes}"
# }
