output "acr_login_server" {
  description = "The login server URL for the ACR"
  value       = azurerm_container_registry.aks_acr.login_server
}

output "acr_id" {
  description = "The ID of the ACR"
  value       = azurerm_container_registry.aks_acr.id
}

output "resource_group_name" {
  value = "nodegrouptest6695"
}

output "location" {
  value = "West US 2"
}

output "acr_name" {
  value = "acrtest6695"
}