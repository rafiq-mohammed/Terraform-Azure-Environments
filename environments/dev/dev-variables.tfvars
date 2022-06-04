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
/*
nsg_array = {
  port8080 = {
    nsg_name                   = "teusnetslnnsg01"
    location                   = "eastus"
    resource_group_name        = "TEUSNETSLNARG01"
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
    nsg_name                   = "teusnetslnnsg01"
    location                   = "eastus"
    resource_group_name        = "TEUSNETSLNARG01"
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
    nsg_name                   = "teusnetslnnsg01"
    location                   = "eastus"
    resource_group_name        = "TEUSNETSLNARG01"
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
*/
