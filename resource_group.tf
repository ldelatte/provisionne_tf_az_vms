resource "azurerm_resource_group" "resource_group" {
  name     = "example-resources"
  location = var.az_region
  tags = { Contact = var.contact, Project = var.projet }
}
