// WEU Boot Diagnostics Storage Accounts

resource "azurerm_storage_account" "gchstorweuubtsdiag10" {
  provider                 = azurerm.weu-uat-bts-sub
  name                     = "gchstorweuubtsdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[0]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.gch-weu-uat-bts-subnet[0].id]
    ip_rules                   = []
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[0]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "gchstorweuudigitaldiag10" {
  provider                 = azurerm.weu-uat-digital-sub
  name                     = "gchstorweuudigitaldiag10"
  resource_group_name      = local.weu-bootdiag-rgs[1]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.gch-weu-uat-digital-subnet[0].id]
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[1]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "gchstorweupbtsdiag10" {
  provider                 = azurerm.weu-prod-bts-sub
  name                     = "gchstorweupbtsdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[2]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.gch-weu-prod-bts-subnet[0].id]
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[2]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "gchstorweupdigitaldiag10" {
  provider            = azurerm.weu-prod-digital-sub
  name                = "gchstorweupdigitaldiag10"
  resource_group_name = local.weu-bootdiag-rgs[3]
  location            = var.location-weu
  account_tier        = "Standard"
  min_tls_version     = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.gch-weu-prod-digital-subnet[0].id]
  }
  blob_properties {
    versioning_enabled = true
  }
  account_replication_type        = "LRS"
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[3]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "gchstorweupsecdiag10" {
  provider                 = azurerm.weu-security-sub
  name                     = "gchstorweupsecdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[4]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = []
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[4]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "gchstorweupmgmtdiag10" {
  provider                 = azurerm.weu-management-sub
  name                     = "gchstorweupmgmtdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[5]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.gch-weu-prod-management-subnet[0].id]
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[5]]
  allow_nested_items_to_be_public = false
}

resource "azurerm_storage_account" "gchstorweudmgmtdiag10" {
  provider                 = azurerm.weu-management-sub
  name                     = "gchstorweudmgmtdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[6]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.gch-weu-dev-management-subnet[0].id]
  }
  min_tls_version = "TLS1_2"
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[6]]
  allow_nested_items_to_be_public = false
}
resource "azurerm_storage_account" "gchstorweudbtsdiag10" {
  provider                 = azurerm.weu-dev-bts-sub
  name                     = "gchstorweudbtsdiag10"
  resource_group_name      = local.weu-bootdiag-rgs[7]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.gch-weu-dev-bts-subnet[0].id]
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[7]]
  allow_nested_items_to_be_public = false
}
resource "azurerm_storage_account" "gchstorweuddigitaldiag10" {
  provider                 = azurerm.weu-dev-digital-sub
  name                     = "gchstorweuddigitaldiag10"
  resource_group_name      = local.weu-bootdiag-rgs[8]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [azurerm_subnet.gch-weu-dev-digital-subnet[0].id]
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[8]]
  allow_nested_items_to_be_public = false
}
resource "azurerm_storage_account" "gchstorweupiddiag10" {
  provider                 = azurerm.weu-identity-sub
  name                     = "gchstorweupiddiag10"
  resource_group_name      = local.weu-bootdiag-rgs[9]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[9]]
  allow_nested_items_to_be_public = false
}
resource "azurerm_storage_account" "gchstorweudiddiag10" {
  provider                 = azurerm.weu-identity-sub
  name                     = "gchstorweudiddiag10"
  resource_group_name      = local.weu-bootdiag-rgs[10]
  location                 = var.location-weu
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  network_rules {
    default_action = "Deny"
    bypass         = ["AzureServices"]
  }
  blob_properties {
    versioning_enabled = true
  }
  tags                            = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[10]]
  allow_nested_items_to_be_public = false
}

