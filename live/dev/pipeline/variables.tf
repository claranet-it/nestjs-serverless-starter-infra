variable "app_name" {
  type        = string
  description = "Application name"
}

variable "app_short" {
  type        = string
  description = "Short name of the application"
}

variable "stage" {
  type        = string
  description = "Stage name (dev, staging, prod)"
}

variable "aws_params" {
  type        = map(string)
  description = "AWS parameters"

  default = {
    region  = "eu-west-1"
    profile = "default"
  }
}

variable "github_repository" {
  type        = map(string)
  description = "GitHub repository parameters"

  default = {
    name   = "my/repo"
    branch = "main"
  }
}

variable "build_template" {
  description = "Path to the buildspec file"
  type        = string
}

variable "test_template" {
  description = "Path to the testspec file"
  type        = string
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the pipeline"

  default = {
    Owner   = "owner"
    Destroy = "false"
  }
}