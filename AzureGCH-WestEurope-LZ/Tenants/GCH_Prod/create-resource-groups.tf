
resource "azurerm_resource_group" "gch-rg-weu-shared-connectivity-core-network" {
  provider = azurerm.weu-connectivity-sub
  name     = "gch-rg-weu-prod-shared-connectivity-core-network"
  location = var.location-weu
  tags     = local.prod_shared_network_tags
}

resource "azurerm_resource_group" "gch-rg-weu-prod-shared-connectivity-zcc-network" {
  provider = azurerm.weu-connectivity-sub
  name     = "gch-rg-weu-prod-shared-connectivity-zcc-network"
  location = var.location-weu
  tags     = local.weu_zpa_tags["gch-rg-weu-prod-shared-management-core-zpa"]
}

resource "azurerm_resource_group" "gch-rg-weu-prod-shared-connectivity-zcc-01" {
  provider = azurerm.weu-connectivity-sub
  name     = "gch-rg-weu-prod-shared-connectivity-zcc-01"
  location = var.location-weu
  tags     = local.weu_zpa_tags["gch-rg-weu-prod-shared-management-core-zpa"]
}


resource "azurerm_resource_group" "gch-rg-weu-dev-shared-management-core-network" {
  provider = azurerm.weu-management-sub
  name     = "gch-rg-weu-dev-shared-management-core-network"
  location = var.location-weu
  tags     = local.dev_shared_network_tags
}
resource "azurerm_resource_group" "gch-rg-weu-prod-shared-management-core-network" {
  provider = azurerm.weu-management-sub
  name     = "gch-rg-weu-prod-shared-management-core-network"
  location = var.location-weu
  tags     = local.prod_shared_network_tags
}
resource "azurerm_resource_group" "gch-rg-weu-shared-dev-identity-core-network" {
  provider = azurerm.weu-identity-sub
  name     = "gch-rg-weu-dev-shared-identity-core-network"
  location = var.location-weu
  tags     = local.dev_shared_network_tags
}
resource "azurerm_resource_group" "gch-rg-weu-shared-prod-identity-core-network" {
  provider = azurerm.weu-identity-sub
  name     = "gch-rg-weu-prod-shared-identity-core-network"
  location = var.location-weu
  tags     = local.prod_shared_network_tags
}


//Landing Zones
resource "azurerm_resource_group" "gch-rg-weu-prod-bts-core-network" {
  provider = azurerm.weu-prod-bts-sub
  name     = "gch-rg-weu-prod-bts-core-network"
  location = var.location-weu

  tags = local.prod_bts_network_tags
}
resource "azurerm_resource_group" "gch-rg-weu-prod-digital-core-network" {
  provider = azurerm.weu-prod-digital-sub
  name     = "gch-rg-weu-prod-digital-core-network"
  location = var.location-weu
  tags     = local.prod_digital_network_tags
}
resource "azurerm_resource_group" "gch-rg-weu-dev-bts-core-network" {
  provider = azurerm.weu-dev-bts-sub
  name     = "gch-rg-weu-dev-bts-core-network"
  location = var.location-weu
  tags     = local.dev_bts_network_tags
}
resource "azurerm_resource_group" "gch-rg-weu-dev-digital-core-network" {
  provider = azurerm.weu-dev-digital-sub
  name     = "gch-rg-weu-dev-digital-core-network"
  location = var.location-weu
  tags     = local.dev_digital_network_tags
}
resource "azurerm_resource_group" "gch-rg-weu-uat-bts-core-network" {
  provider = azurerm.weu-uat-bts-sub
  name     = "gch-rg-weu-uat-bts-core-network"
  location = var.location-weu
  tags     = local.uat_bts_network_tags
}
resource "azurerm_resource_group" "gch-rg-weu-uat-digital-core-network" {
  provider = azurerm.weu-uat-digital-sub
  name     = "gch-rg-weu-uat-digital-core-network"
  location = var.location-weu
  tags     = local.uat_digital_network_tags
}

resource "azurerm_resource_group" "weu-identity-rgs" {
  provider = azurerm.weu-identity-sub
  count    = length(local.weu-identity-rgs)
  name     = local.weu-identity-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_dctags[local.weu-identity-rgs[count.index]]
}

// Resource Groups for Logic Monitor Servers

resource "azurerm_resource_group" "weu-lmc-rgs" {
  provider = azurerm.weu-management-sub
  count    = length(local.weu-lmc-rgs)
  name     = local.weu-lmc-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_lmc_tags[local.weu-lmc-rgs[count.index]]
}

//Resource Groups for Jump servers

resource "azurerm_resource_group" "weu-jmp-rgs" {
  provider = azurerm.weu-management-sub
  count    = length(local.weu-jmp-rgs)
  name     = local.weu-jmp-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_jmp_server_tags[local.weu-jmp-rgs[count.index]]
}


//Resource Groups for ZPA servers


resource "azurerm_resource_group" "weu-zpa-rgs" {
  provider = azurerm.weu-management-sub
  count    = length(local.weu-zpa-rgs)
  name     = local.weu-zpa-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_zpa_tags[local.weu-zpa-rgs[count.index]]
}

//Azure KeyVault Resource Groups

resource "azurerm_resource_group" "weu-uat-bts-akv-rg" {
  provider = azurerm.weu-uat-bts-sub
  name     = local.weu-akv-rgs[0]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[0]]
}

resource "azurerm_resource_group" "weu-uat-digital-akv-rg" {
  provider = azurerm.weu-uat-digital-sub
  name     = local.weu-akv-rgs[1]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[1]]
}

resource "azurerm_resource_group" "weu-prod-bts-akv-rg" {
  provider = azurerm.weu-prod-bts-sub
  name     = local.weu-akv-rgs[2]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[2]]
}

resource "azurerm_resource_group" "weu-prod-digital-akv-rg" {
  provider = azurerm.weu-prod-digital-sub
  name     = local.weu-akv-rgs[3]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[3]]
}

resource "azurerm_resource_group" "weu-prod-shared-security-akv-rg" {
  provider = azurerm.weu-security-sub
  name     = local.weu-akv-rgs[4]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[4]]
}

resource "azurerm_resource_group" "weu-prod-shared-management-akv-rg" {
  provider = azurerm.weu-management-sub
  name     = local.weu-akv-rgs[5]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[5]]
}

resource "azurerm_resource_group" "weu-dev-shared-management-akv-rg" {
  provider = azurerm.weu-management-sub
  name     = local.weu-akv-rgs[6]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[6]]
}

resource "azurerm_resource_group" "weu-dev-bts-akv-rg" {
  provider = azurerm.weu-dev-bts-sub
  name     = local.weu-akv-rgs[7]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[7]]
}

resource "azurerm_resource_group" "weu-dev-digital-akv-rg" {
  provider = azurerm.weu-dev-digital-sub
  name     = local.weu-akv-rgs[8]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[8]]
}

resource "azurerm_resource_group" "weu-prod-shared-identity-akv-rg" {
  provider = azurerm.weu-identity-sub
  name     = local.weu-akv-rgs[9]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[9]]
}

resource "azurerm_resource_group" "weu-dev-shared-identity-akv-rg" {
  provider = azurerm.weu-identity-sub
  name     = local.weu-akv-rgs[10]
  location = var.location-weu
  tags     = local.weu_akv_tags[local.weu-akv-rgs[10]]
}


//Recovery Services Vault

resource "azurerm_resource_group" "weu-rsv-rgs" {
  provider = azurerm.weu-management-sub
  count    = length(local.weu-rsv-rgs)
  name     = local.weu-rsv-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_tags[local.weu-rsv-rgs[count.index]]
}

resource "azurerm_resource_group" "weu-rsv-identity-rgs" {
  provider = azurerm.weu-identity-sub
  count    = length(local.weu-rsv-identity-rgs)
  name     = local.weu-rsv-identity-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_identity_tags[local.weu-rsv-identity-rgs[count.index]]
}

resource "azurerm_resource_group" "weu-rsv-prod-rgs" {
  provider = azurerm.weu-prod-bts-sub
  count    = length(local.weu-rsv-prod-rgs)
  name     = local.weu-rsv-prod-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_prod_tags[local.weu-rsv-prod-rgs[count.index]]
}

resource "azurerm_resource_group" "weu-rsv-dev-rgs" {
  provider = azurerm.weu-dev-bts-sub
  count    = length(local.weu-rsv-dev-rgs)
  name     = local.weu-rsv-dev-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_dev_tags[local.weu-rsv-dev-rgs[count.index]]
}

resource "azurerm_resource_group" "weu-rsv-uat-rgs" {
  provider = azurerm.weu-uat-bts-sub
  count    = length(local.weu-rsv-uat-rgs)
  name     = local.weu-rsv-uat-rgs[count.index]
  location = var.location-weu
  tags     = local.weu_rsv_uat_tags[local.weu-rsv-uat-rgs[count.index]]
}

//Boot Diagnostics Resource Groups

resource "azurerm_resource_group" "weu-uat-bts-bootdiagnostics-rg" {
  provider = azurerm.weu-uat-bts-sub
  name     = local.weu-bootdiag-rgs[0]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[0]]
}
resource "azurerm_resource_group" "weu-uat-digital-bootdiagnostics-rg" {
  provider = azurerm.weu-uat-digital-sub
  name     = local.weu-bootdiag-rgs[1]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[1]]
}
resource "azurerm_resource_group" "weu-prod-bts-bootdiagnostics-rg" {
  provider = azurerm.weu-prod-bts-sub
  name     = local.weu-bootdiag-rgs[2]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[2]]
}
resource "azurerm_resource_group" "weu-prod-digital-bootdiagnostics-rg" {
  provider = azurerm.weu-prod-digital-sub
  name     = local.weu-bootdiag-rgs[3]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[3]]
}
resource "azurerm_resource_group" "weu-prod-shared-security-bootdiagnostics-rg" {
  provider = azurerm.weu-security-sub
  name     = local.weu-bootdiag-rgs[4]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[4]]
}

resource "azurerm_resource_group" "weu-prod-shared-management-bootdiagnostics-rg" {
  provider = azurerm.weu-management-sub
  name     = local.weu-bootdiag-rgs[5]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[5]]
}
resource "azurerm_resource_group" "weu-dev-shared-management-bootdiagnostics-rg" {
  provider = azurerm.weu-management-sub
  name     = local.weu-bootdiag-rgs[6]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[6]]
}
resource "azurerm_resource_group" "weu-dev-bts-bootdiagnostics-rg" {
  provider = azurerm.weu-dev-bts-sub
  name     = local.weu-bootdiag-rgs[7]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[7]]
}
resource "azurerm_resource_group" "weu-dev-digital-bootdiagnostics-rg" {
  provider = azurerm.weu-dev-digital-sub
  name     = local.weu-bootdiag-rgs[8]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[8]]
}
resource "azurerm_resource_group" "weu-prod-shared-identity-bootdiagnostics-rg" {
  provider = azurerm.weu-identity-sub
  name     = local.weu-bootdiag-rgs[9]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[9]]
}
resource "azurerm_resource_group" "weu-dev-shared-identity-bootdiagnostics-rg" {
  provider = azurerm.weu-identity-sub
  name     = local.weu-bootdiag-rgs[10]
  location = var.location-weu
  tags     = local.weu_bootdiag_tags[local.weu-bootdiag-rgs[10]]
}

//Log Analytics Resource Groups

# resource "azurerm_resource_group" "weu-la-workspace-rg" {
#   provider = azurerm.weu-management-sub
#   name     = local.all-regions-laworkspace-rg[2]
#   location = var.location-weu
#   tags     = local.prod_log_tags
# }



//++++++++++++++++++++++++++++++++++++++++ Security Subscription RGS +++++++++++++++++++++++++++++++++++++++

resource "azurerm_resource_group" "weu-security-logs-rgs" {
  provider = azurerm.weu-security-sub
  count    = length(local.security-subscription-rg)
  name     = local.security-subscription-rg[count.index]
  location = var.location-weu
  tags     = local.security_subscription_tags[local.security-subscription-rg[count.index]]
}
