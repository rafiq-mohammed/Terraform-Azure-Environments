#
rg_array = {
  DEUSNETRAFARG01 = "eastus" 
  DEUSSVCRAFARG01 = "eastus" 
  DEUSSTRRAFARG01 = "eastus" 
}

vnet_array = {
  deussvcrafavn01 = {
    location       = "eastus"
    address        = "192.168.0.0/22"
    resource_group = "DEUSNETRAFARG01"
  }
}

subnet_array = {
  deussvcrafasn01 = {
    address        = "192.168.1.0/24"
    resource_group = "DEUSNETRAFARG01"
    vnet_name      = "deussvcrafavn01"
  },
  deussvcrafasn02 = {
    address        = "192.168.2.0/24"
    resource_group = "DEUSNETRAFARG01"
    vnet_name      = "deussvcrafavn01"
  }
}

nsg_array = {
  port8080 = {
    nsg_name                   = "deusnetrafnsg01"
    location                   = "eastus"
    resource_group_name        = "dEUSNETRAFARG01"
    priority                   = "100"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefixes    = "10.151.0.0/24"
    destination_address_prefix = "VirtualNetwork"
  },
  port2345 = {
    nsg_name                   = "deusnetrafnsg01"
    location                   = "eastus"
    resource_group_name        = "DEUSNETRAFARG01"
    priority                   = "200"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "2345"
    source_address_prefixes    = "10.151.0.0/24"
    destination_address_prefix = "VirtualNetwork"
  },
    port4567 = {
    nsg_name                   = "deusnetrafnsg01"
    location                   = "eastus"
    resource_group_name        = "DEUSNETRAFARG01"
    priority                   = "300"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "4567"
    source_address_prefixes    = "10.151.0.0/24"
    destination_address_prefix = "VirtualNetwork"
  }
}

### PostgresDB 
pg_name                              = "deussvcrafapg01"
location                             = "eastus"
rg_name                              = "DEUSSTRRAFARG01"
sku_name                             = "GP_Gen5_2"
storage_mb                           = 5120
backup_retention_days                = 7
geo_redundant_backup                 = "Disabled"
administrator_login                  = "postgres_admin"
administrator_login_password         = "Pgpasswd09)"
version_pg                           = "11"
ssl_enforcement                      = "Enabled"
vnet_pg                              = "deussvcrafapg01-vnet"
ignore_missing_vnet_service_endpoint = true
pep_name                             = "deussvcrafapg01-pep"
psc_name                             = "deussvcrafpgs01-psc"
psc_subresource_names                = "postgresqlServer"

### CosmosDB
cassandradb_name                     = "deussvcrafcdb01"
mongodb_name                         = "deussvcrafcdb02"
cosmosdb_rg_name                     = "DEUSSTRRAFARG01"
cosmosdb_location                    = "eastus"
offer_type                           = "Standard"
cosmosdb_kind_mongo                  = "MongoDB"
cosmosdb_kind_cassandra              = "GlobalDocumentDB"
cosmosdb_automatic_failover          = true
consistency_level                    = "Session"