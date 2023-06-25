module "rg" {
  source = "../rg"
}

resource "azurerm_linux_function_app" "az_function" {
  name                = "functionapp21312"
  resource_group_name = module.rg.rg_name
  location            = module.rg.rg_location

  storage_account_name       = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  service_plan_id            = azurerm_service_plan.service_plan.id

  site_config {}
}