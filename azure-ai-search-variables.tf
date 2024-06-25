#################################
## Azure AI Search - Variables ##
#################################

variable "azure_ai_sku" {
  description = "The pricing tier of the search service you want to create (for example, basic or standard)."
  default     = "standard"
  type        = string
  validation {
    condition     = contains(["free", "basic", "standard", "standard2", "standard3", "storage_optimized_l1", "storage_optimized_l2"], var.azure_ai_sku)
    error_message = "The sku must be one of the following values: free, basic, standard, standard2, standard3, storage_optimized_l1, storage_optimized_l2."
  }
}

variable "azure_ai_replica_count" {
  type        = number
  description = "Replicas distribute search workloads across the service. You need at least two replicas to support high availability of query workloads (not applicable to the free tier)."
  default     = 1
  validation {
    condition     = var.azure_ai_replica_count >= 1 && var.azure_ai_replica_count <= 12
    error_message = "The replica_count must be between 1 and 12."
  }
}

variable "azure_ai_partition_count" {
  type        = number
  description = "Partitions allow for scaling of document count as well as faster indexing by sharding your index over multiple search units."
  default     = 1
  validation {
    condition     = contains([1, 2, 3, 4, 6, 12], var.azure_ai_partition_count)
    error_message = "The partition_count must be one of the following values: 1, 2, 3, 4, 6, 12."
  }
}

variable "azure_ai_public_network_access_enabled" {
  type        = bool
  description = "Enable public network access"
  default     = false
}

variable "azure_ai_allowed_ips" {
  type        = list(string)
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the AI Search service"
  default     = []
}
