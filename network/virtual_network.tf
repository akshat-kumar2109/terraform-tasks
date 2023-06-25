module "rg" {
  source = "../rg"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = module.rg.rg_location
  resource_group_name = module.rg.rg_name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "private" {
  name                 = "private"
  resource_group_name  = module.rg.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "public" {
  name                 = "public"
  resource_group_name  = module.rg.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
