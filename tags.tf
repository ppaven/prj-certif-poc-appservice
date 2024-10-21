module "tags" {
  source                 = "../../modules/tags/"
  app_code               = var.app_code
  app_owner              = var.app_owner
  date_creation          = var.date_creation
  app_criticity          = var.app_criticity
  technical_contact      = var.technical_contact
  auto_shutdown_schedule = var.auto_shutdown_schedule
}
