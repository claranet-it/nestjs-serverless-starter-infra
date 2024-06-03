variable "app_name" {
  type        = string
  description = "Application name"
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
