# Outputs
output "rg_names" {
    value = module.resource_group.rg_names
}

output "vnet_names" {
    value = module.virtual_network.vnet_names
}

output "subnet_ids" {
    value = module.subnet.subnet_ids
}

output "nsg_ids" {
    value = module.network_security_group.nsg_ids
}