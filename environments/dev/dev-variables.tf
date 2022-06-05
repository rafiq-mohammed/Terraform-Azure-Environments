# Only declaration here
variable "rg_array" { 
    type = map 
}

variable "vnet_array" {
  type = map(object({
    location        = string
    address         = string
    resource_group  = string
  }))
}

variable "subnet_array" {
  type = map(object({
    address        = string
    resource_group = string
    vnet_name      = string
  }))
}

variable "nsg_array" {
  type = map(object({
    nsg_name                   = string
    location                   = string
    resource_group_name        = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = number
    source_address_prefixes    = string
    destination_address_prefix = string
  }))
}

### PostgresDB
variable "pg_name" {}
variable "location" {}
variable "rg_name" {}
variable "sku_name" {}
variable "storage_mb" {}
variable "backup_retention_days" {}
variable "geo_redundant_backup" {}
variable "administrator_login" {}
variable "administrator_login_password" {}
variable "version_pg" {}
variable "ssl_enforcement" {}
# azurerm_postgresql_virtual_network_rule
variable "vnet_pg" {}
variable "ignore_missing_vnet_service_endpoint" {}
# Postgres_azurerm_private_endpoint
variable "pep_name" {}
variable "psc_name" {}
#variable "pep_subnet_id" {}
variable "psc_subresource_names" {}
#variable "is_manual_connection" {}

### CosmosDB
variable "cassandradb_name" {}
variable "mongodb_name" {}
variable "cosmosdb_rg_name" {}
variable "cosmosdb_location" {}
variable "offer_type" {}
variable "cosmosdb_kind_mongo" {}
variable "cosmosdb_kind_cassandra" {}
variable "cosmosdb_automatic_failover" {}
variable "consistency_level" {}