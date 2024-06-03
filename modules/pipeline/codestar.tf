resource "aws_codestarconnections_connection" "source_connection" {
  name          = "${local.pipeline_short}-codestar"
  provider_type = "GitHub"

  tags = var.tags
}