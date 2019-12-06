/*****************
  common parts
*****************/
variable "env" {
}

variable "region" {
  description = "resource gorup env"
  type        = "string"
}

variable "prefix" {
  description = "mgcp prefix"
  type        = "string"
}

variable "common_tags" {
  description = "mgcp common tags"
  type        = "map"
}

variable "description" {
  type        = "string"
  description = "The description of the all resources."
}

/*****************
  aws_iam parts
*****************/
variable "iam_path" {
  default     = "/"
  type        = "string"
  description = "Path in which to create the IAM Role and the IAM Policy."
}
variable "account_id" {
  type = "map"
}
variable "codebuild_deployment_role" {
  type = "map"
}
variable "codebuild_service_role" {
  type = "string"
}
