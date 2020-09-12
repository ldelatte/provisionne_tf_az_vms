output "azurerm_public_ip1" {
  value = azurerm_public_ip.public_ip1.ip_address
  depends_on = [azurerm_linux_virtual_machine.linux_vm1]
}
output "azurerm_private_ip1" {
  value = azurerm_network_interface.net_if1.ip_configuration[0].private_ip_address
  depends_on = [azurerm_network_interface.net_if1]
}

output "azurerm_public_ip2" {
  value = azurerm_public_ip.public_ip2.ip_address
  depends_on = [azurerm_linux_virtual_machine.linux_vm2]
}
output "azurerm_private_ip2" {
  value = azurerm_network_interface.net_if2.ip_configuration[0].private_ip_address
  depends_on = [azurerm_network_interface.net_if2]
}
