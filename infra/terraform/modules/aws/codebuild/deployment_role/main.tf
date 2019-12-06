
locals {
  iam_name                   = "${var.codebuild_deployment_role["${var.env}"]}"
  codebuild_service_role_arn = "arn:aws:iam::${var.account_id["ops"]}:role/${var.codebuild_service_role}"
}
# 
# CodeBuild deploy Role
# 
resource "aws_iam_role" "this" {
  name               = "${local.iam_name}"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
  path               = "${var.iam_path}"
  description        = "${var.description}"
  tags               = "${merge(map("Name", local.iam_name), var.common_tags)}"
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["${local.codebuild_service_role_arn}"]
    }
  }
}
data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}
resource "aws_iam_policy" "this" {
  name        = "${local.iam_name}-policy"
  policy      = "${data.aws_iam_policy_document.policy.json}"
  path        = "${var.iam_path}"
  description = "${var.description}"
}

resource "aws_iam_role_policy_attachment" "default" {
  role       = "${aws_iam_role.this.name}"
  policy_arn = "${aws_iam_policy.this.arn}"
}
