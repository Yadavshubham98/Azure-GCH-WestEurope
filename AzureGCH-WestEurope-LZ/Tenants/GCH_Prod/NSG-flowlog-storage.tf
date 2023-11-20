resource "azurerm_storage_account" "gchstorweupsecflowlog" {
  provider                 = azurerm.weu-security-sub
  name                     = "gchstorweupsecflowlog"
  resource_group_name      = local.security-subscription-rg[2]
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
  tags                            = local.security_subscription_tags[local.security-subscription-rg[2]]
  allow_nested_items_to_be_public = false
}


resource "azurerm_storage_account" "gchstorweudsecflowlog" {
  provider                 = azurerm.weu-security-sub
  name                     = "gchstorweudsecflowlog"
  resource_group_name      = local.security-subscription-rg[3]
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
  tags                            = local.security_subscription_tags[local.security-subscription-rg[3]]
  allow_nested_items_to_be_public = false
}
