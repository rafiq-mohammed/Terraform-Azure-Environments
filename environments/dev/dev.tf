#
provider "azurerm" {
  features {}
}

terraform {
  required_version = ">= 0.12.6"
  backend "azurerm" {
  }
}

module "resource_group" {
  source                   = "git::https://github.com/rafiq-mohammed/Terraform-Azure-Environments.git/Terraform-Azure-Modules//resource_group?ref=develop"
  rg_array                 = var.rg_array
}

/*
module "virtual_network" {
  source                   = "git::https://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@eysbp.visualstudio.com/ProjectTiger/_git/SLOAN_IAC_MODULES//virtual_network?ref=develop"
  vnet_array               = var.vnet_array
  vnet_depends_on          = [module.resource_group]
}

module "subnet" {
  source                   = "git::https://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@eysbp.visualstudio.com/ProjectTiger/_git/SLOAN_IAC_MODULES//subnet?ref=develop"
  subnet_array             = var.subnet_array
  subnet_depends_on        = [module.virtual_network]
}

module "network_security_group" {
  source                   = "git::https://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@eysbp.visualstudio.com/ProjectTiger/_git/SLOAN_IAC_MODULES//network_security_group?ref=develop"
  nsg_array                = var.nsg_array
  nsg_depends_on           = [module.subnet]
}

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
*/
