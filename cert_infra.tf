module "cert-infra" {
  source          = "../../modules/certif-mgmt-infra/"
  subscription_id = var.subscription_id
  location        = var.location

  tags = module.tags.datamap
}
