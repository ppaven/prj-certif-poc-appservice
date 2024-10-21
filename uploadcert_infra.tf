module "uploadcert-infra" {
  source          = "../../modules/uploadcert-infra/"
  subscription_id = var.subscription_id
  location        = var.location

  tags = module.tags.datamap
}
