locals {
  appservice_name = lower("${var.company_trig}${var.env}${var.service_name}app02")
}

resource "azurerm_linux_web_app" "webapp" {
  name                = local.appservice_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.tst_appsp.id
  https_only          = "true"

  site_config {
    always_on           = false
    minimum_tls_version = "1.2"
  }

  tags = module.tags.datamap
}


#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id                 = azurerm_linux_web_app.webapp.id
  repo_url               = "https://github.com/Azure-Samples/nodejs-docs-hello-world"
  branch                 = "master"
  use_manual_integration = true
  use_mercurial          = false
}

#########################
# Custom Domain configuration

# Write TXT record for verification
resource "azurerm_dns_txt_record" "domain-verif" {
  name                = "asuid.${azurerm_linux_web_app.webapp.name}"
  zone_name           = var.zone_name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 300

  record {
    value = azurerm_linux_web_app.webapp.custom_domain_verification_id
  }
}

# Write CNAME record
resource "azurerm_dns_cname_record" "cname-record" {
  name                = local.appservice_name
  zone_name           = azurerm_dns_zone.pub_zone.name
  resource_group_name = azurerm_resource_group.dns.name
  ttl                 = 300
  record              = azurerm_linux_web_app.webapp.default_hostname

  depends_on = [azurerm_dns_txt_record.domain-verif]
}

# Binding to the custom Domain
resource "azurerm_app_service_custom_hostname_binding" "hostname-binding" {
  hostname            = "${azurerm_linux_web_app.webapp.name}.${var.zone_name}"
  app_service_name    = azurerm_linux_web_app.webapp.name
  resource_group_name = azurerm_resource_group.rg.name

  depends_on = [azurerm_dns_txt_record.domain-verif, azurerm_dns_cname_record.cname-record]
}
