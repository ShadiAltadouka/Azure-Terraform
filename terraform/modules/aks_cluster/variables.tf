variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet that the AKS cluster will use"
  type        = string
}

variable "acr_login_server" {
  description = "The login server URL of the Azure Container Registry"
  type        = string
}

variable "acr_name" {
  description = "Name of the ACR"
  type = string
}

variable "ssh_key_data" {
  description = "The SSH public key data for the AKS Linux nodes"
  type        = string
}
