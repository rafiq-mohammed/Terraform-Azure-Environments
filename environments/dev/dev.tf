#
provider "azurerm" {
  features {}
  skip_provider_registration = "true"
}

terraform {
  required_version = ">= 0.12.6"
  backend "azurerm" {
  }
}

module "resource_group" {
  #source                   = "git::https://github.com/rafiq-mohammed/Terraform-Azure-Environments.git/Terraform-Azure-Modules//resource_group?ref=develop"
  source                   = "github.com/rafiq-mohammed/Terraform-Azure-Modules.git//resource_group?ref=release-1.0"
  rg_array                 = var.rg_array
}


module "virtual_network" {
  source                   = "github.com/rafiq-mohammed/Terraform-Azure-Modules.git//virtual_network?ref=release-1.0"
  vnet_array               = var.vnet_array
  vnet_depends_on          = [module.resource_group]
}

module "subnet" {
  source                   = "github.com/rafiq-mohammed/Terraform-Azure-Modules.git//subnet?ref=release-1.0"
  subnet_array             = var.subnet_array
  subnet_depends_on        = [module.virtual_network]
}

module "network_security_group" {
  source                   = "github.com/rafiq-mohammed/Terraform-Azure-Modules.git//network_security_group?ref=release-1.0"
  nsg_array                = var.nsg_array
  nsg_depends_on           = [module.subnet]
}

# Subnet association to NSG
resource "azurerm_subnet_network_security_group_association" "nsg_subnet_assoc" {
 subnet_id                  = module.subnet.subnet_ids[0]
 network_security_group_id  = module.network_security_group.nsg_ids[0]
 depends_on                 = [module.subnet, module.network_security_group]
}
resource "azurerm_subnet_network_security_group_association" "nsg_subnet_assoc1" {
 subnet_id                  = module.subnet.subnet_ids[1]
 network_security_group_id  = module.network_security_group.nsg_ids[0]
 depends_on                 = [module.subnet, module.network_security_group]
}

## PostgresDB
module "pg" {
  source                               = "github.com/rafiq-mohammed/Terraform-Azure-Modules.git//postgres?ref=release-1.0"
  pg_name                              = var.pg_name
  location                             = var.location
  #rg_name                              = data.terraform_remote_state.network.outputs.rg_names[0]
  rg_name                              = module.resource_group.rg_names[0]
  sku_name                             = var.sku_name
  storage_mb                           = var.storage_mb
  backup_retention_days                = var.backup_retention_days
  geo_redundant_backup                 = var.geo_redundant_backup
  administrator_login                  = var.administrator_login
  administrator_login_password         = var.administrator_login_password
  version_pg                           = var.version_pg
  ssl_enforcement                      = var.ssl_enforcement
  vnet_pg                              = var.vnet_pg
  #vnet_subnet_id                       = data.terraform_remote_state.network.outputs.subnet_ids[0]
  vnet_subnet_id                       = module.subnet.subnet_ids[0]
  ignore_missing_vnet_service_endpoint = var.ignore_missing_vnet_service_endpoint
  pep_name                             = var.pep_name         
  pep_subnet_id                        = module.subnet.subnet_ids[0]
  psc_name                             = var.psc_name
  psc_subresource_names                = var.psc_subresource_names
  #is_manual_connnection                = var.is_manual_connnection
}

## CosmosDB
module "cosmosdb" {
  source                               = "github.com/rafiq-mohammed/Terraform-Azure-Modules.git//cosmos_db?ref=release-1.0"
  cassandradb_name                     = var.cassandradb_name
  mongodb_name                         = var.mongodb_name
  cosmosdb_rg_name                     = var.cosmosdb_rg_name
  cosmosdb_location                    = var.cosmosdb_location
  offer_type                           = var.offer_type
  cosmosdb_kind_mongo                  = var.cosmosdb_kind_mongo
  cosmosdb_kind_cassandra              = var.cosmosdb_kind_cassandra
  cosmosdb_automatic_failover          = var.cosmosdb_automatic_failover
  consistency_level                    = var.consistency_level
  pep_subnet_id                        = module.subnet.subnet_ids[0]
}