variable "resource_group_name" {
  description = "The name of the resource group where the ACR will be created"
  type        = string
}

variable "location" {
  description = "The Azure region to create the ACR in"
  type        = string
}

variable "acr_name" {
  description = "ACR Name"
  type = string
}