module "certificate" {
  source = "../../modules/create-certif/"

  aaa_subs_id        = var.subscription_id
  aaa_rgp            = "AZC-POC-RG-CERT"
  aaa_name           = "azc-poc-cert-aaa"
  domain_names       = "${azurerm_linux_web_app.webapp.name}.${var.zone_name}"
  dns_subscription   = data.azurerm_subscription.subs.display_name
  dns_resource_group = local.dns_rg_name
  dns_zone           = var.zone_name
  subscription       = data.azurerm_subscription.subs.display_name
  resource_group     = local.resource_group_name
  resource_type      = "AppService"
  resources          = local.appservice_name
}
