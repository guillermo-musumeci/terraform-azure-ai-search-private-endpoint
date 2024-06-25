####################
# Common Variables #
####################
company       = "kopicloud"
app_name      = "aisearch"
environment   = "dev"
location      = "westeurope"

tags = {
  application = "Azure AI Search"
  environment = "Development"
}

##################
# Authentication #
##################
azure-subscription-id = "complete-this"
azure-client-id       = "complete-this"
azure-client-secret   = "complete-this"
azure-tenant-id       = "complete-this"

###########
# Network #
###########
vnet_address_space   = "10.150.0.0/16"
subnet_address_space = "10.150.1.0/24"

#############
# AI Search #
#############
azure_ai_sku             = "standard"
azure_ai_replica_count   = 1
azure_ai_partition_count = 1

azure_ai_public_network_access_enabled = false

azure_ai_allowed_ips = []

#######
# DNS #
#######
private_dns_resource_group = "kopicloud-core-dev-we-dns-rg"
