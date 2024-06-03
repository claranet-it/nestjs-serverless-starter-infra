variable "name" {
  description = "Name of the pipeline"
  type        = string
}

variable "shortname" {
  description = "Short name of the pipeline"
  type        = string
}

variable "stage" {
  description = "Name of the stage"
  type        = string
}

variable "artifact_store_bucket" {
  description = "Name of the S3 bucket to store artifacts"
  type        = string
}

variable "source_repository" {
  description = "GitHub repository URL"
  type        = string
}

variable "branch_name" {
  description = "GitHub repository branch name"
  type        = string
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
  description = "Tags to apply to the pipeline"
  type        = map(string)
}