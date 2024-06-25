################################
## Azure Provider - Variables ##
################################

# Azure authentication variables

variable "azure-subscription-id" {
  type        = string
  description = "Azure Subscription ID"
}

variable "azure-client-id" {
  type        = string
  description = "Azure Client ID"
}

variable "azure-client-secret" {
  type        = string
  description = "Azure Client Secret"
}

variable "azure-tenant-id" {
  type        = string
  description = "Azure Tenant ID"
}

#############################
## Application - Variables ##
#############################

# Company name 
variable "company" {
  type        = string
  description = "This variable defines the company name used to build resources"
}

# Application name 
variable "app_name" {
  type        = string
  description = "This variable defines the application name used to build resources"
}

# Environment
variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
}

# Azure region
variable "location" {
  type        = string
  description = "Azure region where resources will be created"
  default     = "west europe"
}

variable "tags" {
  description = "Tags to be applied to the service"
  type        = map(string)
  default     = {}
}

#########################
## Network - Variables ##
#########################

variable "vnet_address_space" {
  type        = string
  description = "VNET for AI Search VNET"
}

variable "subnet_address_space" {
  type        = string
  description = "Subnet for AI Search Public Endpoint"
}

#####################
## DNS - Variables ##
#####################

variable "private_dns_resource_group" {
  type        = string
  description = "The Resource Group where the Private DNS for AI Search was created"
}
