#########################
## Network - Resources ##
#########################

# Create the Resource Group
resource "azurerm_resource_group" "this" {
  name     = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-rg"
  location = var.location

  tags = var.tags
}

# Create the VNET for Private Endpoint
resource "azurerm_virtual_network" "this" {
  name                = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-vnet"
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name

  tags = var.tags
}

# Create the Subnet for Private Endpoint
resource "azurerm_subnet" "this" {
  name                 = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-subnet"
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.subnet_address_space]

  private_endpoint_network_policies = "Enabled"

  service_endpoints = ["Microsoft.CognitiveServices"]
}
