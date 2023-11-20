terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "gch-rg-eus-prod-shared-terraform" //replace with your own storage account resource group for the state file
    storage_account_name = "gchstoreuspcoretf100"             //replace with your own storage account name
    container_name       = "tfstate-container"                //replace with your own container name
    key                  = "GchWestEuropeLz-RGLocks.tfstate"  //replace with your own file name for the state file ending in .tfstate
  }
}

provider "azuread" {
  use_msi   = true
  tenant_id = var.tenant_id

}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  subscription_id = local.platform-weu-connectivity-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true // refer to https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block for the settings on the features block
      recover_soft_deleted_key_vaults = true
    }

    log_analytics_workspace {
      permanently_delete_on_destroy = false
    }
    resource_group {
      prevent_deletion_if_contains_resources = true // set to true for production
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = true
    }
  }
}

//East US Platform Providers
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-connectivity-sub"
  subscription_id = local.platform-weu-connectivity-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-identity-sub"
  subscription_id = local.platform-weu-identity-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-management-sub"
  subscription_id = local.platform-weu-management-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-security-sub"
  subscription_id = local.platform-weu-security-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-prod-bts-sub"
  subscription_id = local.weu-prod-bts-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-prod-digital-sub"
  subscription_id = local.weu-prod-digital-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-dev-digital-sub"
  subscription_id = local.weu-dev-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-dev-bts-sub"
  subscription_id = local.weu-dev-bts-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-uat-digital-sub"
  subscription_id = local.weu-uat-digital-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "weu-uat-bts-sub"
  subscription_id = local.weu-uat-bts-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


//NEU Platform Providers
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-connectivity-sub"
  subscription_id = local.platform-neu-connectivity-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-identity-sub"
  subscription_id = local.platform-neu-identity-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-management-sub"
  subscription_id = local.platform-neu-management-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-security-sub"
  subscription_id = local.platform-neu-security-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

//India Platform Providers

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-connectivity-sub"
  subscription_id = local.platform-ind-connectivity-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-identity-sub"
  subscription_id = local.platform-ind-identity-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-management-sub"
  subscription_id = local.platform-ind-management-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-security-sub"
  subscription_id = local.platform-ind-security-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


//WUS Platform Providers
provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-connectivity-sub"
  subscription_id = local.platform-wus-connectivity-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-identity-sub"
  subscription_id = local.platform-wus-identity-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-management-sub"
  subscription_id = local.platform-wus-management-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-security-sub"
  subscription_id = local.platform-wus-security-sub
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

//NEU Landing Zones

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-prod-digital-sub"
  subscription_id = local.neu-prod-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-prod-bts-sub"
  subscription_id = local.neu-prod-bts-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-dev-digital-sub"
  subscription_id = local.neu-dev-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-dev-bts-sub"
  subscription_id = local.neu-dev-bts-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-uat-digital-sub"
  subscription_id = local.neu-uat-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "neu-uat-bts-sub"
  subscription_id = local.neu-uat-bts-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}



// India Landing Zones

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-prod-digital-sub"
  subscription_id = local.ind-prod-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-prod-bts-sub"
  subscription_id = local.ind-prod-bts-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-dev-digital-sub"
  subscription_id = local.ind-dev-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-dev-bts-sub"
  subscription_id = local.ind-dev-bts-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-uat-digital-sub"
  subscription_id = local.ind-uat-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "ind-uat-bts-sub"
  subscription_id = local.ind-uat-bts-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}



//WUS Landing Zones

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-prod-digital-sub"
  subscription_id = local.wus-prod-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-prod-bts-sub"
  subscription_id = local.wus-prod-bts-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-dev-digital-sub"
  subscription_id = local.wus-dev-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}


provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-dev-bts-sub"
  subscription_id = local.wus-dev-bts-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-uat-digital-sub"
  subscription_id = local.wus-uat-digital-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

provider "azurerm" {
  use_msi         = true
  tenant_id       = var.tenant_id
  alias           = "wus-uat-bts-sub"
  subscription_id = local.wus-uat-bts-sub

  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }

    resource_group {
      prevent_deletion_if_contains_resources = true
    }


    virtual_machine {
      delete_os_disk_on_deletion     = true
      graceful_shutdown              = false
      skip_shutdown_and_force_delete = false
    }
  }
}

