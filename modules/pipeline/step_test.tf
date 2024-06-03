resource "aws_codebuild_project" "test" {
  name           = "${local.pipeline_name}-test"
  description    = "test"
  build_timeout  = "15"
  queued_timeout = "10"
  service_role   = aws_iam_role.codebuild_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_MEDIUM"
    image           = "aws/codebuild/amazonlinux2-x86_64-standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "PIPELINE_NAME"
      value = local.pipeline_name
    }

    environment_variable {
      name  = "STAGE_NAME"
      value = var.stage
    }

    environment_variable {
      name  = "AWS_REGION"
      value = data.aws_region.current.name
    }

    environment_variable {
      name  = "AWS_ACCOUNT"
      value = data.aws_caller_identity.current.account_id
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = data.local_file.testspec_local.content
  }

  logs_config {
    cloudwatch_logs {
      group_name = aws_cloudwatch_log_group.test.name
    }
  }

  tags = var.tags
}

resource "aws_cloudwatch_log_group" "test" {
  name              = "/aws/codebuild/${local.pipeline_name}/test"
  retention_in_days = 30

  tags = var.tags
}
