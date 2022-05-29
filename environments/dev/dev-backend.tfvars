# Location of tfstate file
resource_group_name   = "terraform"
storage_account_name  = "tfstatebackups"
container_name        = "tfstate"
key                   = "dev.tfstate"