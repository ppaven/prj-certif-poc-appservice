
locals {
  appservice_plan_name = lower("${var.company_trig}${var.env}${var.service_name}appsp01")
}

resource "azurerm_service_plan" "tst_appsp" {
  name                = local.appservice_plan_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"

  sku_name = "B1"

  tags = module.tags.datamap
}
