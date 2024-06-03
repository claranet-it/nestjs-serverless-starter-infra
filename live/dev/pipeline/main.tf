# The aws_codestarconnections_connection resource is created in the state PENDING. 
# Authentication with the connection provider must be completed in the AWS Console. 
# See the AWS documentation for details.
module "pipeline" {
  source                = "../../../modules/pipeline"
  name                  = var.app_name
  shortname             = var.app_short
  stage                 = var.stage
  artifact_store_bucket = local.artifact_store_bucket
  source_repository     = local.repository_name
  branch_name           = local.branch_name
  build_template        = var.build_template
  test_template         = var.test_template
  tags                  = var.tags
}