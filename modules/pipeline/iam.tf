### CODEPIPELINE ###
resource "aws_iam_role" "codepipeline_role" {
  name               = "codepipeline_role_${local.pipeline_name}"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume_role.json
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name   = "codepipeline_policy_${local.pipeline_name}"
  role   = aws_iam_role.codepipeline_role.id
  policy = data.aws_iam_policy_document.codepipeline_policy.json
}

### CODEBUILD ###
resource "aws_iam_role" "codebuild_role" {
  name               = "codebuild_role_${local.pipeline_name}"
  assume_role_policy = data.aws_iam_policy_document.codebuild_assume_role.json
}

resource "aws_iam_role_policy" "codebuild_policy" {
  name   = "codebuild_policy_${local.pipeline_name}"
  role   = aws_iam_role.codebuild_role.id
  policy = data.aws_iam_policy_document.codebuild_policy.json
}
