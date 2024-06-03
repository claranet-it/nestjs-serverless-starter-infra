module "state" {
  source      = "../../../modules/tfstate"
  bucket_name = local.bucket_name
  table_name  = local.table_name
}
