# Reference to Private DNS Zone for AI Search
data "azurerm_private_dns_zone" "ai_search_dns_zone" {
  name                = "privatelink.search.windows.net"
  resource_group_name = var.private_dns_resource_group
}
