######################################
## Azure AI Search Private Endpoint ##
######################################

# Create Private DNS Zone Virtual Network Link
resource "azurerm_private_dns_zone_virtual_network_link" "this" {
  name                  = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-vnet-link"
  resource_group_name   = data.azurerm_private_dns_zone.ai_search_dns_zone.resource_group_name
  private_dns_zone_name = data.azurerm_private_dns_zone.ai_search_dns_zone.name
  virtual_network_id    = azurerm_virtual_network.this.id
}

# Create the Private Endpoint
resource "azurerm_private_endpoint" "this" {
  name                = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-pe"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  subnet_id           = azurerm_subnet.this.id

  private_service_connection {
    name                           = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-pe-psc"
    is_manual_connection           = false
    private_connection_resource_id = azurerm_search_service.this.id
    subresource_names              = ["searchService"]
  }

  tags = var.tags
}

# Create the DNS A Record for the Private Endpoint
resource "azurerm_private_dns_a_record" "this" {
  name                = azurerm_search_service.this.name
  zone_name           = data.azurerm_private_dns_zone.ai_search_dns_zone.name
  resource_group_name = data.azurerm_private_dns_zone.ai_search_dns_zone.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.this.private_service_connection[0].private_ip_address]
}
