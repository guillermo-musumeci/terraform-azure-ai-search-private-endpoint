#################################
## Azure AI Search - Resources ##
#################################

resource "azurerm_search_service" "this" {
  name                = "${lower(replace(var.company," ","-"))}-${var.app_name}-${var.environment}-search"
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku                 = var.azure_ai_sku
  replica_count       = var.azure_ai_replica_count
  partition_count     = var.azure_ai_partition_count

  public_network_access_enabled = var.azure_ai_public_network_access_enabled
  allowed_ips                   = var.azure_ai_allowed_ips
  local_authentication_enabled  = true

  tags = var.tags
}

