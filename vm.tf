resource "azurerm_linux_virtual_machine" "linux_vm1" {
  name                = "example-vm1"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  size                = "Standard_D1_v2"
  admin_username      = var.vmusername
  network_interface_ids = [ azurerm_network_interface.net_if1.id, ]
  admin_ssh_key {
    username   = var.vmusername
    public_key = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
  tags     = {
    deployment  = "terraform"
    Contact = var.contact
    Projet = var.projet
  }
}
resource "azurerm_network_interface" "net_if1" {
  name                = "example-nic1"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  ip_configuration {
    name                          = "ip-config1"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip1.id
  }
  tags     = {
    deployment  = "terraform"
    Contact = var.contact
    Projet = var.projet
  }
}
resource "azurerm_public_ip" "public_ip1" {
  name                = "example-pip1"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  allocation_method   = "Dynamic"
  tags     = {
    deployment  = "terraform"
    Contact = var.contact
    Projet = var.projet
  }
}
resource "azurerm_network_interface_security_group_association" "nsg_ass_if1" {
  network_interface_id      = azurerm_network_interface.net_if1.id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}

resource "azurerm_linux_virtual_machine" "linux_vm2" {
  name                = "example-vm2"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  size                = "Standard_D1_v2"
  admin_username      = var.vmusername
  network_interface_ids = [ azurerm_network_interface.net_if2.id, ]
  admin_ssh_key {
    username   = var.vmusername
    public_key = file("~/.ssh/id_rsa.pub")
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
  tags     = {
    deployment  = "terraform"
    Contact = var.contact
    Projet = var.projet
  }
}
resource "azurerm_network_interface" "net_if2" {
  name                = "example-nic2"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  ip_configuration {
    name                          = "ip-config1"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip2.id
  }
  tags     = {
    deployment  = "terraform"
    Contact = var.contact
    Projet = var.projet
  }
}
resource "azurerm_public_ip" "public_ip2" {
  name                = "example-pip2"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  allocation_method   = "Dynamic"
  tags     = {
    deployment  = "terraform"
    Contact = var.contact
    Projet = var.projet
  }
}
