locals {
  dns_rg_name = "${var.company_trig}-${var.env}-RG-DNS"
}

resource "azurerm_resource_group" "dns" {
  name       = local.dns_rg_name
  location   = var.location

  tags = module.tags.datamap
}

resource "azurerm_dns_zone" "pub_zone" {
  name                = var.zone_name
  resource_group_name = azurerm_resource_group.dns.name

  tags = module.tags.datamap
}