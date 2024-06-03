locals {
  pipeline_name         = "${var.app_name}-${var.stage}-pipeline"
  artifact_store_bucket = "${var.app_name}-${var.stage}-artifact"

  repository_name = var.github_repository.name
  branch_name     = var.github_repository.branch
}