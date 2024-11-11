# Output the AKS Cluster ID
output "aks_cluster_id" {
  description = "The ID of the AKS Cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.id  # This refers to the id of the AKS cluster resource
}

# Output the AKS Cluster Name (if needed)
output "aks_cluster_name" {
  description = "The Name of the AKS Cluster"
  value       = "akstest6695"  # This refers to the name of the AKS cluster resource
}

# Output the kube_config_raw for kubectl access
output "kube_config" {
  description = "The raw kubeconfig for accessing the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
}

# Optionally, output the role assignment ID (if you want to confirm the role assignment creation)
output "aks_acr_pull_role_assignment_id" {
  description = "The ID of the AKS ACR pull role assignment"
  value       = azurerm_role_assignment.aks_acr_pull.id
}

output "location" {
  value = "West US 2"
}

output "acr_name" {
  value = "acrtest6695"
}

output "ssh_key_data" {
  value = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCHsqF1S7bnIqmCZUuLBXzhZ2RYZFY/zihJhgHns5ddVFqb8JP3qF10amZzHZ1UTW9f4MtVuRQM6dzlLm1QqEsZOhsFFC4mnt7eWYfP7hTPDTfjB04rT5sVCC1kW8OFuQdIcKggSNoN5V1VCXajv8npcbSJdd9QP+EtNAhPJvoR9RU6vm35WsryePF6zLrW47Dkgm7eP+3vnJcQ4OOzjz0Y5diYRs2nfAhuP7DmjgPjlPZy8TeTaDKIG7as/Ys9FEFAbe695Quf9cnwWPglrlwgzo7sdtWUeDm7tBidiHDIsZDa4oukjmvngsIqcxSRKJAEoElGS9Phn8qmwwFdw/1F azureuser@Test"
}
