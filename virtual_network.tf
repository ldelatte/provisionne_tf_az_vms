resource "azurerm_virtual_network" "virtual_network" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  address_space       = [var.cidr]
  tags     = {
    deployment  = "terraform"
    Contact = var.contact
    Projet = var.projet
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "example-subnet1"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  address_prefixes       = ["10.0.1.0/24"]
  tags     = {
    deployment  = "terraform"
    Contact = var.contact
    Projet = var.projet
  }
}
## resource "azurerm_subnet_network_security_group_association" "subnet_nsg_association1" {
  ## subnet_id                 = azurerm_subnet.subnet1.id
  ## network_security_group_id = azurerm_network_security_group.nsg1.id
## }
