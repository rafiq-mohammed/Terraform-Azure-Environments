# Only declaration here
variable "rg_array" { 
    type = map 
}
/*
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
*/