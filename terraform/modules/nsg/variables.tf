variable "resource_group_name" {
  description = "The name of the resource group where the network will be created"
  type        = string
}

variable "location" {
  description = "The Azure region to create the network in"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "aks-vnet"
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "aks-subnet"
}

variable "address_space" {
  description = "The address space for the VNet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "The address prefix for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}
