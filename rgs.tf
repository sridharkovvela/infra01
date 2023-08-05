resource "azurerm_resource_group" "hubrg01" {
  name     = var.resource_group_name
  location = var.resource_group_location
  tags = {
    "createdBy" : "SridharK"
  }
}

resource "azurerm_virtual_network" "hubvnet01" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.hubrg01.location
  resource_group_name = azurerm_resource_group.hubrg01.name
  address_space       = ["10.0.0.0/16"]
  # dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    # security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}