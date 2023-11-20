
# //PROD weu

data "azurerm_key_vault" "get-weu-uat-bts-vault" {
  provider            = azurerm.weu-uat-bts-sub
  name                = "gchakvweuubtsencrpt-10"
  resource_group_name = "gch-rg-weu-uat-bts-akv"
  depends_on          = [azurerm_key_vault.gchakvweuubtsencrypt10]
}

module "gch-weu-uat-bts-keys" {
  providers = {
    azurerm = azurerm.weu-uat-bts-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[0]
  # key_vault_id = data.azurerm_key_vault.get-weu-uat-bts-vault.id
  key_vault_id = azurerm_key_vault.gchakvweuubtsencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweuubtsencrypt10
  ]
  # depends_on = [data.azurerm_key_vault.get-weu-uat-bts-vault
  # ]
}

data "azurerm_key_vault" "get-weu-uat-digital-vault" {
  provider            = azurerm.weu-uat-digital-sub
  name                = "gchakvweuudigencrpt-10"
  resource_group_name = "gch-rg-weu-uat-digital-akv"
  depends_on = [azurerm_key_vault.gchakvweuudigitalencrypt10
  ]
}

module "gch-weu-uat-digital-keys" {
  providers = {
    azurerm = azurerm.weu-uat-digital-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[1]
  # key_vault_id = data.azurerm_key_vault.get-weu-uat-digital-vault.id
  key_vault_id = azurerm_key_vault.gchakvweuudigitalencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweuudigitalencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-prod-bts-vault" {
  provider            = azurerm.weu-prod-bts-sub
  name                = "gchakvweupbtsencrpt-10"
  resource_group_name = "gch-rg-weu-prod-bts-akv"
  depends_on = [azurerm_key_vault.gchakvweupbtsencrypt10
  ]
}

module "gch-weu-prod-bts-keys" {
  providers = {
    azurerm = azurerm.weu-prod-bts-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[2]
  # key_vault_id = data.azurerm_key_vault.get-weu-prod-bts-vault.id
  key_vault_id = azurerm_key_vault.gchakvweupbtsencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweupbtsencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-prod-digital-vault" {
  provider            = azurerm.weu-prod-digital-sub
  name                = "gchakvweupdigencrpt-10"
  resource_group_name = "gch-rg-weu-prod-digital-akv"
  depends_on = [azurerm_key_vault.gchakvweupdigitalencrypt10
  ]
}

module "gch-weu-prod-digital-keys" {
  providers = {
    azurerm = azurerm.weu-prod-digital-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[3]
  # key_vault_id = data.azurerm_key_vault.get-weu-prod-digital-vault.id
  key_vault_id = azurerm_key_vault.gchakvweupdigitalencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweupdigitalencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-prod-shared-management-vault" {
  provider            = azurerm.weu-management-sub
  name                = "gchakvweupmgmtencrpt-10"
  resource_group_name = "gch-rg-weu-prod-shared-management-akv"
  depends_on = [azurerm_key_vault.gchakvweupmgmtencrypt10
  ]
}

module "gch-weu-prod-shared-management-keys" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[5]
  # key_vault_id = data.azurerm_key_vault.get-weu-prod-shared-management-vault.id
  key_vault_id = azurerm_key_vault.gchakvweupmgmtencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweupmgmtencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-dev-shared-management-vault" {
  provider            = azurerm.weu-management-sub
  name                = "gchakvweudmgmtencrpt-10"
  resource_group_name = "gch-rg-weu-dev-shared-management-akv"
  depends_on = [azurerm_key_vault.gchakvweudmgmtencrypt10
  ]
}

module "gch-weu-dev-shared-management-keys" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[6]
  # key_vault_id = data.azurerm_key_vault.get-weu-dev-shared-management-vault.id
  key_vault_id = azurerm_key_vault.gchakvweudmgmtencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweudmgmtencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-dev-bts-vault" {
  provider            = azurerm.weu-dev-bts-sub
  name                = "gchakvweudbtsencrpt-10"
  resource_group_name = "gch-rg-weu-dev-bts-akv"
  depends_on = [azurerm_key_vault.gchakvweudbtsencrypt10
  ]
}

module "gch-weu-dev-bts-keys" {
  providers = {
    azurerm = azurerm.weu-dev-bts-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[7]
  # key_vault_id = data.azurerm_key_vault.get-weu-dev-bts-vault.id
  key_vault_id = azurerm_key_vault.gchakvweudbtsencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweudbtsencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-dev-digital-vault" {
  provider            = azurerm.weu-dev-digital-sub
  name                = "gchakvweuddigencrpt-10"
  resource_group_name = "gch-rg-weu-dev-digital-akv"
  depends_on = [azurerm_key_vault.gchakvweuddigitalencrypt10
  ]
}

module "gch-weu-dev-digital-keys" {
  providers = {
    azurerm = azurerm.weu-dev-digital-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[8]
  # key_vault_id = data.azurerm_key_vault.get-weu-dev-digital-vault.id
  key_vault_id = azurerm_key_vault.gchakvweuddigitalencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweuddigitalencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-prod-shared-identity-vault" {
  provider            = azurerm.weu-identity-sub
  name                = "gchakvweupidencrpt-10"
  resource_group_name = "gch-rg-weu-prod-shared-identity-akv"
  depends_on = [azurerm_key_vault.gchakvweupidencrypt10
  ]
}

module "gch-weu-prod-shared-identity-keys" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[9]
  # key_vault_id = data.azurerm_key_vault.get-weu-prod-shared-identity-vault.id
  key_vault_id = azurerm_key_vault.gchakvweupidencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweupidencrypt10
  ]
}

data "azurerm_key_vault" "get-weu-dev-shared-identity-vault" {
  provider            = azurerm.weu-identity-sub
  name                = "gchakvweudidencrpt-10"
  resource_group_name = "gch-rg-weu-dev-shared-identity-akv"
  depends_on = [azurerm_key_vault.gchakvweudidencrypt10
  ]
}

module "gch-weu-dev-shared-identity-keys" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }
  source      = "../../Modules/Create-Key-Vault-Keys"
  nb_instance = 1
  server_name = local.vm-keys-weu[10]
  # key_vault_id = data.azurerm_key_vault.get-weu-dev-shared-identity-vault.id
  key_vault_id = azurerm_key_vault.gchakvweudidencrypt10.id
  key_type     = "RSA"
  key_size     = "2048"
  depends_on = [azurerm_key_vault.gchakvweudidencrypt10
  ]
}

