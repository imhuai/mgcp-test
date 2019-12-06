
prefix      = "mgcp"
region      = "us-east-1"
region_abbr = "ue-1"
env         = "test"

common_tags = {
  owner = "mgcp"
  env   = "test"
  sys   = "mgcp"
}

account_id = {
  ops = "421923624608"
}
codebuild_service_role = "mgcp-ops-codebuild-service-role"
codebuild_deployment_role = {
  test = "mgcp-test-codebuild-deployment-role"
}
