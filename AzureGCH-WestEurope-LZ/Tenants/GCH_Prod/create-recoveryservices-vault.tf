resource "azurerm_recovery_services_vault" "weu-vault" {
  provider                     = azurerm.weu-management-sub
  name                         = "gch-rsv-weu-prod-shared-management-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_tags[local.weu-rsv-rgs[0]]

}
resource "azurerm_recovery_services_vault" "weu-dev-vault" {
  provider                     = azurerm.weu-management-sub
  name                         = "gch-rsv-weu-dev-shared-management-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_tags[local.weu-rsv-rgs[1]]
}

resource "azurerm_recovery_services_vault" "weu-identity-vault" {
  provider                     = azurerm.weu-identity-sub
  name                         = "gch-rsv-weu-prod-shared-identity-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-identity-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_identity_tags[local.weu-rsv-identity-rgs[0]]

}

resource "azurerm_recovery_services_vault" "weu-dev-identity-vault" {
  provider                     = azurerm.weu-identity-sub
  name                         = "gch-rsv-weu-dev-shared-identity-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-identity-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_identity_tags[local.weu-rsv-identity-rgs[1]]

}

resource "azurerm_recovery_services_vault" "weu-prod-bts-vault" {
  provider                     = azurerm.weu-prod-bts-sub
  name                         = "gch-rsv-weu-prod-bts-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-prod-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_prod_tags[local.weu-rsv-prod-rgs[0]]

}

resource "azurerm_recovery_services_vault" "weu-prod-digital-vault" {
  provider                     = azurerm.weu-prod-digital-sub
  name                         = "gch-rsv-weu-prod-digital-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-prod-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_prod_tags[local.weu-rsv-prod-rgs[1]]

}

resource "azurerm_recovery_services_vault" "weu-dev-bts-vault" {
  provider                     = azurerm.weu-dev-bts-sub
  name                         = "gch-rsv-weu-dev-bts-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-dev-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_dev_tags[local.weu-rsv-dev-rgs[0]]

}

resource "azurerm_recovery_services_vault" "weu-dev-digital-vault" {
  provider                     = azurerm.weu-dev-digital-sub
  name                         = "gch-rsv-weu-dev-digital-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-dev-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_dev_tags[local.weu-rsv-dev-rgs[1]]

}

resource "azurerm_recovery_services_vault" "weu-uat-bts-vault" {
  provider                     = azurerm.weu-uat-bts-sub
  name                         = "gch-rsv-weu-uat-bts-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-uat-rgs[0].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_uat_tags[local.weu-rsv-uat-rgs[0]]

}

resource "azurerm_recovery_services_vault" "weu-uat-digital-vault" {
  provider                     = azurerm.weu-uat-digital-sub
  name                         = "gch-rsv-weu-uat-digital-01"
  location                     = var.location-weu
  resource_group_name          = azurerm_resource_group.weu-rsv-uat-rgs[1].name
  sku                          = "Standard"
  storage_mode_type            = "GeoRedundant"
  soft_delete_enabled          = true
  cross_region_restore_enabled = true
  tags                         = local.weu_rsv_uat_tags[local.weu-rsv-uat-rgs[1]]

}


//############################################ BACKUP  POLICIES #########################################

resource "azurerm_backup_policy_vm" "gch-weu-prod-daily-policy" {
  provider            = azurerm.weu-management-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "gch-weu-dev-daily-policy" {
  provider            = azurerm.weu-management-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-dev-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "gch-weu-prod-identity-daily-policy" {
  provider            = azurerm.weu-identity-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-identity-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-identity-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "gch-weu-dev-identity-daily-policy" {
  provider            = azurerm.weu-identity-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-identity-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-dev-identity-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

// prod Sub policy

resource "azurerm_backup_policy_vm" "gch-weu-prod-bts-daily-policy" {
  provider            = azurerm.weu-prod-bts-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-prod-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-prod-bts-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "gch-weu-prod-digital-daily-policy" {
  provider            = azurerm.weu-prod-digital-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-prod-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-prod-digital-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}


// Dev Backup policy

resource "azurerm_backup_policy_vm" "gch-weu-dev-bts-daily-policy" {
  provider            = azurerm.weu-dev-bts-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-dev-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-dev-bts-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "gch-weu-dev-digital-daily-policy" {
  provider            = azurerm.weu-dev-digital-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-dev-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-dev-digital-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}


// UAT Backup Policy 


resource "azurerm_backup_policy_vm" "gch-weu-uat-bts-daily-policy" {
  provider            = azurerm.weu-uat-bts-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-uat-rgs[0].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-uat-bts-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

resource "azurerm_backup_policy_vm" "gch-weu-uat-digital-daily-policy" {
  provider            = azurerm.weu-uat-digital-sub
  name                = "gch-weu-daily-policy"
  resource_group_name = azurerm_resource_group.weu-rsv-uat-rgs[1].name
  recovery_vault_name = azurerm_recovery_services_vault.weu-uat-digital-vault.name
  timezone            = "UTC"
  backup {
    frequency = "Daily"
    time      = "21:30"
  }
  instant_restore_retention_days = 5
  retention_daily {
    count = 7
  }
  retention_weekly {
    count    = 4
    weekdays = ["Saturday"]
  }
  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}
