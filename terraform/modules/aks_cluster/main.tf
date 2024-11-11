resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "aks-dns"

  linux_profile {
    admin_username = "azureuser"
    ssh_key {
      key_data = var.ssh_key_data
    }
  }

  network_profile {
    network_plugin = "azure"
    service_cidr = "10.1.0.0/16"  # Change this CIDR range to something non-conflicting
    dns_service_ip   = "10.1.0.10" # Optional
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    vnet_subnet_id = var.vnet_subnet_id
  }

  identity {
    type = "SystemAssigned"  # This ensures the AKS cluster gets a managed identity
  }

  tags = {
    Environment = "Development"
  }
}

# Role Assignment to grant the AKS-managed identity the "acrPull" permission on the ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
  role_definition_name = "AcrPull"  # The ACR pull role
  scope                = "/subscriptions/${data.azurerm_subscription.primary.subscription_id}/resourceGroups/${var.resource_group_name}/providers/Microsoft.ContainerRegistry/registries/${var.acr_name}"  # The login server URL of the ACR
}

data "azurerm_subscription" "primary" {}
