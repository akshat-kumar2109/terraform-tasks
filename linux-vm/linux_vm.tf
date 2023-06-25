module "rg" {
  source = "../rg"
}

module "network" {
  source = "../network"
}

resource "azurerm_network_interface" "nic" {
  name                = "nic"
  location            = module.rg.rg_location
  resource_group_name = module.rg.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.network.private_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
  name                = "linuxVM"
  resource_group_name = module.rg.rg_name
  location            = module.rg.rg_location
  size                = "Standard_B1s"
  admin_username      = "azureuser"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("./id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}