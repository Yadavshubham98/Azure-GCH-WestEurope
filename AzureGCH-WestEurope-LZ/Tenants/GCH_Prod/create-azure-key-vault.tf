data "azurerm_client_config" "current" {
}

data "azurerm_subnet" "GCH-EUS-SHARED-PROD-PRIVATE" {
  provider             = azurerm.genpact-cloud-hosting-sub
  name                 = "GCH-EUS-SHARED-PROD-PRIVATE"
  virtual_network_name = "GCH-EUS-SHARED-PROD-VNET"
  resource_group_name  = "GCH-EUS-SHARED-PROD-RG"
}

# resource "azurerm_subnet_service_endpoint_policy" "gch-weu-uat-bts-subnet-priv-endpoints" {
#   subnet_id                  = azurerm_subnet.gch-weu-uat-bts-subnet[0].id
#   service_endpoint_type     = "Microsoft.KeyVault"
#   service_endpoint_policy   = "Enabled"
# }

resource "azurerm_key_vault" "gchakvweuubtsencrypt10" {
  # depends_on = [azurerm_subnet_service_endpoint_polcy.gch-weu-uat-bts-subnet-priv-endpoints]
  provider                    = azurerm.weu-uat-bts-sub
  name                        = "gchakvweuubtsencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[0]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30
  purge_protection_enabled    = true

  enabled_for_deployment          = true
  sku_name                        = "standard"
  enabled_for_template_deployment = true
  tags                            = local.weu_akv_tags[local.weu-akv-rgs[0]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id, azurerm_subnet.gch-weu-uat-bts-subnet[0].id]

  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id //var.managed_identity_principal_id data.azuread_user.user.object_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}

# resource "azurerm_subnet_service_endpoint_policy" "gch-weu-uat-digital-subnet-priv-endpoints" {
#   subnet_id                  = azurerm_subnet.gch-weu-uat-digital-subnet[0].id
#   service_endpoint_type     = "Microsoft.KeyVault"
#   service_endpoint_policy   = "Enabled"
# }


resource "azurerm_key_vault" "gchakvweuudigitalencrypt10" {
  # depends_on = [azurerm_subnet_service_endpoint_polcy.gch-weu-uat-digital-subnet-priv-endpoints]
  provider                    = azurerm.weu-uat-digital-sub
  name                        = "gchakvweuudigencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[1]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = true
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[1]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id, azurerm_subnet.gch-weu-uat-digital-subnet[0].id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}


# resource "azurerm_subnet_service_endpoint_policy" "gch-weu-prod-bts-subnet-priv-endpoints" {
#   subnet_id                  = azurerm_subnet.gch-weu-prod-bts-subnet[0].id
#   service_endpoint_type     = "Microsoft.KeyVault"
#   service_endpoint_policy   = "Enabled"
# }

resource "azurerm_key_vault" "gchakvweupbtsencrypt10" {
  # depends_on = [azurerm_subnet_service_endpoint_polcy.gch-weu-prod-bts-subnet-priv-endpoints]
  provider                    = azurerm.weu-prod-bts-sub
  name                        = "gchakvweupbtsencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[2]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = true
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[2]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id, azurerm_subnet.gch-weu-prod-bts-subnet[0].id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}


# resource "azurerm_subnet_service_endpoint_policy" "gch-weu-prod-digital-subnet-priv-endpoints" {
#   subnet_id                  = azurerm_subnet.gch-weu-prod-digital-subnet[0].id
#   service_endpoint_type     = "Microsoft.KeyVault"
#   service_endpoint_policy   = "Enabled"
# }

resource "azurerm_key_vault" "gchakvweupdigitalencrypt10" {
  # depends_on = [azurerm_subnet_service_endpoint_polcy.gch-weu-prod-digital-subnet-priv-endpoints]
  provider                    = azurerm.weu-prod-digital-sub
  name                        = "gchakvweupdigencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[3]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = true
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[3]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id, azurerm_subnet.gch-weu-prod-digital-subnet[0].id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }

}



resource "azurerm_key_vault" "gchakvweupsecencrypt10" {
  provider                    = azurerm.weu-security-sub
  name                        = "gchakvweupsecencrypt10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[4]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = true
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[4]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}

# resource "azurerm_subnet_service_endpoint_policy" "gch-weu-prod-management-subnet-priv-endpoints" {
#   subnet_id                  = azurerm_subnet.gch-weu-prod-management-subnet[0].id
#   service_endpoint_type     = "Microsoft.KeyVault"
#   service_endpoint_policy   = "Enabled"
# }

resource "azurerm_key_vault" "gchakvweupmgmtencrypt10" {
  # depends_on = [azurerm_subnet_service_endpoint_polcy.gch-weu-prod-management-subnet-priv-endpoints]
  provider                    = azurerm.weu-management-sub
  name                        = "gchakvweupmgmtencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[5]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = true
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[5]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id, azurerm_subnet.gch-weu-prod-management-subnet[0].id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }

}


# resource "azurerm_subnet_service_endpoint_policy" "gch-weu-dev-management-subnet-priv-endpoints" {
#   subnet_id                  = azurerm_subnet.gch-weu-dev-management-subnet[0].id
#   service_endpoint_type     = "Microsoft.KeyVault"
#   service_endpoint_policy   = "Enabled"
# }


resource "azurerm_key_vault" "gchakvweudmgmtencrypt10" {
  # depends_on = [azurerm_subnet_service_endpoint_polcy.gch-weu-dev-management-subnet-priv-endpoints]
  provider                    = azurerm.weu-management-sub
  name                        = "gchakvweudmgmtencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[6]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = true
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[6]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id, azurerm_subnet.gch-weu-dev-management-subnet[0].id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}


# resource "azurerm_subnet_service_endpoint_policy" "gch-weu-dev-bts-subnet-priv-endpoints" {
#   subnet_id                  = azurerm_subnet.gch-weu-dev-bts-subnet[0].id
#   service_endpoint_type     = "Microsoft.KeyVault"
#   service_endpoint_policy   = "Enabled"
# }


resource "azurerm_key_vault" "gchakvweudbtsencrypt10" {
  # depends_on = [azurerm_subnet_service_endpoint_polcy.gch-weu-dev-bts-subnet-priv-endpoints]
  provider                    = azurerm.weu-dev-bts-sub
  name                        = "gchakvweudbtsencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[7]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = true
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[7]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id, azurerm_subnet.gch-weu-dev-bts-subnet[0].id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}



# resource "azurerm_subnet_service_endpoint_policy" "gch-weu-dev-digital-subnet-priv-endpoints" {
#   subnet_id                  = azurerm_subnet.gch-weu-dev-digital-subnet[0].id
#   service_endpoint_type     = "Microsoft.KeyVault"
#   service_endpoint_policy   = "Enabled"
# }

resource "azurerm_key_vault" "gchakvweuddigitalencrypt10" {
  # depends_on = [azurerm_subnet_service_endpoint_polcy.gch-weu-dev-digital-subnet-priv-endpoints]
  provider                    = azurerm.weu-dev-digital-sub
  name                        = "gchakvweuddigencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[8]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30
  purge_protection_enabled    = true

  enabled_for_deployment = true
  sku_name               = "standard"
  tags                   = local.weu_akv_tags[local.weu-akv-rgs[8]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id, azurerm_subnet.gch-weu-dev-digital-subnet[0].id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}



# resource "azurerm_subnet_service_endpoint_policy" "gch-weu-prod-identity-subnet-priv-endpoints" {
#   subnet_id                  = azurerm_subnet.gch-weu-prod-identity-subnet[0].id
#   service_endpoint_type     = "Microsoft.KeyVault"
#   service_endpoint_policy   = "Enabled"
# }


resource "azurerm_key_vault" "gchakvweupidencrypt10" {
  # depends_on = [azurerm_subnet_service_endpoint_polcy.gch-weu-prod-identity-subnet-priv-endpoints]
  provider                    = azurerm.weu-identity-sub
  name                        = "gchakvweupidencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[9]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30

  purge_protection_enabled = true
  enabled_for_deployment   = true
  sku_name                 = "standard"
  tags                     = local.weu_akv_tags[local.weu-akv-rgs[9]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id, azurerm_subnet.gch-weu-prod-identity-subnet[0].id]
  }
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }

}

resource "azurerm_key_vault" "gchakvweudidencrypt10" {
  provider                    = azurerm.weu-identity-sub
  name                        = "gchakvweudidencrpt-10"
  location                    = var.location-weu
  resource_group_name         = local.weu-akv-rgs[10]
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 30
  purge_protection_enabled    = true

  enabled_for_deployment = true
  sku_name               = "standard"
  tags                   = local.weu_akv_tags[local.weu-akv-rgs[10]]
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    ip_rules                   = []
    virtual_network_subnet_ids = [data.azurerm_subnet.GCH-EUS-SHARED-PROD-PRIVATE.id]
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.managed_identity_principal_id
    key_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Decrypt",
      "Encrypt",
      "UnwrapKey",
      "WrapKey",
      "Verify",
      "Purge"
    ]
    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Backup",
      "Restore"
    ]
    certificate_permissions = [
      "Get",
      "List",
      "Update",
      "Create",
      "Import",
      "Delete",
      "Recover",
      "Backup",
      "Restore",
      "Purge",
      "ManageContacts",
      "ManageIssuers",
      "GetIssuers",
      "ListIssuers",
      "SetIssuers",
      "DeleteIssuers"
    ]
  }
  lifecycle {
    ignore_changes = [
      access_policy,
    ]
  }
}

