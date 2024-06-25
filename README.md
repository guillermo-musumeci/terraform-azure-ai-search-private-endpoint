# How to deploy Azure AI Search with a Private Endpoint using Terraform
[![Terraform](https://img.shields.io/badge/terraform-v1.8+-blue.svg)](https://www.terraform.io/downloads.html)

## Overview

Deploying an Azure AI Search Service with a Private Endpoint

Blog --> https://gmusumeci.medium.com/how-to-deploy-azure-ai-search-with-a-private-endpoint-using-terraform-3b63c8b84f41

## Code creates:

- Resource Group for Network
- VNET and Subnet for Private Endpoint
- Azure AI Search Service
- Private Endpoint

## Azure AI Search Service Variables

List of variables used in this code to configure the Azure AI Search Service:

Variable | Description | Type
--- | --- | ---
`location` | The region in which this module should be deployed | `string`
`vnet_address_space` | CIDR of the VNET used for the Private Endpoint | `string`
`subnet_address_space` | CIDR of the Subnet used for the Private Endpoint | `string`
`private_dns_resource_group` | The Resource Group where the Private DNS for OpenAI was created | `string` 
`azure_ai_public_network_access_enabled` | Enable public network access. Default: false | `bool`
`azure_ai_sku` | The pricing tier of the search service you want to create. Default: standard | `string` 
`azure_ai_replica_count` | Replicas distribute search workloads across the service. You need at least two replicas to support the high availability of query workloads. Default: 1 | `number` 
`azure_ai_partition_count` | Partitions allow for scaling of document count and faster indexing by sharding your index over multiple search units. Default: 1 | `number` 
`azure_ai_allowed_ips` | One or more IP Addresses, or CIDR Blocks which should be able to access the AI Search service. Default: [] | `list(string)` 

- Note #1: The **azure_ai_sku** must be one of the following values: free, basic, standard, standard2, standard3, storage_optimized_l1, storage_optimized_l2.
- Note #2: The **azure_ai_replica_count** must be between 1 and 12.
- Note #3: The **azure_ai_partition_count** must be one of the following values: 1, 2, 3, 4, 6, 12.

## How To deploy the code:

- Clone the repo
- Update variables to your environment
- Execute "terraform init"
- Execute "terraform apply"

## Private DNS Zone

A private DNS zone is required, if you need one, use the code below:

```
# Create the Resource Group for DNS Zone
resource "azurerm_resource_group" "dns_zone" {
  name     = "kopicloud-dns-rg"
  location = var.location
}

# Create Private DNS Zone for OpenAI
resource "azurerm_private_dns_zone" "ai_search" {
  name                = "privatelink.search.windows.net"
  resource_group_name = azurerm_resource_group.dns_zone.name
}
```
