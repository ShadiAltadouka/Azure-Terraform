output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.aks_vnet.id
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.aks_subnet.id
}

output "nsg_id" {
  description = "The ID of the Network Security Group"
  value       = azurerm_network_security_group.aks_nsg.id
}

output "location" {
  value = "West US 2"
}

output "resource_group_name" {
  value = "nodegrouptest6695"
}