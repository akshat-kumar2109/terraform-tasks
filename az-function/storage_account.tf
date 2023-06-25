resource "azurerm_storage_account" "storage_account" {
  name                     = "functionappstorage212"
  resource_group_name      = module.rg.rg_name
  location                 = module.rg.rg_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "service_plan" {
  name                = "functionappserviceplan2121"
  resource_group_name = module.rg.rg_name
  location            = module.rg.rg_location
  os_type             = "Linux"
  sku_name            = "Y1"
}