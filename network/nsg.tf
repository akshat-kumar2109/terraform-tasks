resource "azurerm_network_security_group" "nsg" {
  name                = "privateSubnetNSG"
  location            = module.rg.rg_location
  resource_group_name = module.rg.rg_name
}