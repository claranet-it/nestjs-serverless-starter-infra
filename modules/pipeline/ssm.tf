resource "aws_ssm_parameter" "project" {
  name  = "/pipeline/${local.pipeline_name}"
  type  = "SecureString"
  value = "dummy"

  lifecycle {
    ignore_changes = [value]
  }

  tags = var.tags
}
