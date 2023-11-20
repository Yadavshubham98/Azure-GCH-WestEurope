
# //WEU NSG and associations

resource "azurerm_network_security_group" "weu-prod-management-subnet-nsg" {
  count               = length(local.weu-prod-management-subnet_name)
  name                = "${local.weu-prod-management-subnet_name[count.index]}-nsg"
  location            = var.location-weu
  provider            = azurerm.weu-management-sub
  depends_on          = [azurerm_resource_group.gch-rg-weu-prod-shared-management-core-network, azurerm_subnet.gch-weu-prod-management-subnet]
  resource_group_name = azurerm_resource_group.gch-rg-weu-prod-shared-management-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.130.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }

  tags = local.prod_shared_network_tags

  lifecycle {
    ignore_changes = [
      security_rule,

    ]
  }

}

data "azurerm_network_watcher" "nwatchermanagement" {
  provider            = azurerm.weu-management-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}

data "azurerm_log_analytics_workspace" "gch-la-weu-workspace" {
  provider            = azurerm.weu-security-sub
  name                = "gch-la-weu-workspace"
  resource_group_name = "gch-rg-weu-prod-shared-security-analytics-log"
}

resource "azurerm_network_watcher_flow_log" "gch-snet-weu-prod-management-NSG-flowlog" {
  count                     = length(local.weu-prod-management-subnet_name)
  provider                  = azurerm.weu-management-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatchermanagement.name
  resource_group_name       = data.azurerm_network_watcher.nwatchermanagement.resource_group_name
  name                      = "${local.weu-prod-management-subnet_name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-prod-management-subnet-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.gchstorweupsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]

  lifecycle {
    ignore_changes = [
      location,
    ]
  }

}


resource "azurerm_network_security_group" "weu-dev-management-subnet-nsg" {
  provider            = azurerm.weu-management-sub
  count               = length(local.weu-dev-management-subnet_name)
  name                = "${local.weu-dev-management-subnet_name[count.index]}-nsg"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-dev-shared-management-core-network.name
  depends_on          = [azurerm_subnet.gch-weu-dev-management-subnet]

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.154.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }

  tags = local.dev_shared_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}


resource "azurerm_network_watcher_flow_log" "gch-snet-weu-dev-management-NSG-flowlog" {
  count                     = length(local.weu-dev-management-subnet_name)
  provider                  = azurerm.weu-management-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatchermanagement.name
  resource_group_name       = data.azurerm_network_watcher.nwatchermanagement.resource_group_name
  name                      = "${local.weu-dev-management-subnet_name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-dev-management-subnet-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.gchstorweudsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[1]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}


resource "azurerm_network_security_group" "weu-prod-identity-subnet-nsg" {
  count               = length(local.weu-prod-identity-subnet_name)
  name                = "${local.weu-prod-identity-subnet_name[count.index]}-nsg"
  location            = var.location-weu
  provider            = azurerm.weu-identity-sub
  depends_on          = [azurerm_subnet.gch-weu-prod-identity-subnet]
  resource_group_name = azurerm_resource_group.gch-rg-weu-shared-prod-identity-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.132.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }

  tags = local.prod_shared_network_tags

  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}

data "azurerm_network_watcher" "nwatcheridentity" {
  provider            = azurerm.weu-identity-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}

resource "azurerm_network_watcher_flow_log" "gch-snet-weu-prod-identity-NSG-flowlog" {
  count                     = length(local.weu-prod-identity-subnet_name)
  provider                  = azurerm.weu-identity-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcheridentity.name
  resource_group_name       = data.azurerm_network_watcher.nwatcheridentity.resource_group_name
  name                      = "${local.weu-prod-identity-subnet_name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-prod-identity-subnet-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.gchstorweupsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}


# resource "azurerm_network_security_group" "weu-dev-identity-subnet-nsg" {
#   count               = length(local.weu-dev-identity-subnet_name)
#   name                = "${local.weu-dev-identity-subnet_name[count.index]}-nsg"
#   location            = var.location-weu
#   resource_group_name = azurerm_resource_group.gch-rg-weu-shared-dev-identity-core-network.name

#   security_rule {
#     name                       = "Deny_All_Inbound"
#     description                = "Deny_All_Inbound"
#     priority                   = 4096
#     direction                  = "Inbound"
#     access                     = "Deny"
#     protocol                   = "*"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
#   tags = local.paas_tags
# }

# //weu


resource "azurerm_network_security_group" "weu-prod-bts-nsg" {
  count               = length(local.weu-prod-bts-subnet-name)
  name                = "${local.weu-prod-bts-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  provider            = azurerm.weu-prod-bts-sub
  depends_on          = [azurerm_subnet.gch-weu-prod-bts-subnet]
  resource_group_name = azurerm_resource_group.gch-rg-weu-prod-bts-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.136.0/22" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }

  tags = local.prod_bts_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}

data "azurerm_network_watcher" "nwatcherprodeu" {
  provider            = azurerm.weu-prod-bts-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}

resource "azurerm_network_watcher_flow_log" "gch-snet-weu-prod-bts-NSG-flowlog" {
  count                     = length(local.weu-prod-bts-subnet-name)
  provider                  = azurerm.weu-prod-bts-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcherprodeu.name
  resource_group_name       = data.azurerm_network_watcher.nwatcherprodeu.resource_group_name
  name                      = "${local.weu-prod-bts-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-prod-bts-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.gchstorweupsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}


resource "azurerm_network_security_group" "weu-prod-digital-nsg" {
  provider            = azurerm.weu-prod-digital-sub
  count               = length(local.weu-prod-digital-subnet-name)
  name                = "${local.weu-prod-digital-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.gch-weu-prod-digital-subnet]
  resource_group_name = azurerm_resource_group.gch-rg-weu-prod-digital-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.136.0/22" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.prod_digital_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}

resource "azurerm_network_watcher_flow_log" "gch-snet-weu-prod-digital-NSG-flowlog" {
  count                     = length(local.weu-prod-digital-subnet-name)
  provider                  = azurerm.weu-prod-bts-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcherprodeu.name
  resource_group_name       = data.azurerm_network_watcher.nwatcherprodeu.resource_group_name
  name                      = "${local.weu-prod-digital-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-prod-digital-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.gchstorweupsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}



resource "azurerm_network_security_group" "weu-dev-bts-nsg" {
  count               = length(local.weu-dev-bts-subnet-name)
  provider            = azurerm.weu-dev-bts-sub
  name                = "${local.weu-dev-bts-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.gch-weu-prod-bts-subnet]
  resource_group_name = azurerm_resource_group.gch-rg-weu-dev-bts-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.142.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.dev_bts_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}


data "azurerm_network_watcher" "nwatcherdeveu" {
  provider            = azurerm.weu-dev-bts-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}

resource "azurerm_network_watcher_flow_log" "gch-snet-weu-dev-bts-NSG-flowlog" {
  count                     = length(local.weu-dev-bts-subnet-name)
  provider                  = azurerm.weu-dev-bts-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcherdeveu.name
  resource_group_name       = data.azurerm_network_watcher.nwatcherdeveu.resource_group_name
  name                      = "${local.weu-dev-bts-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-dev-bts-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.gchstorweudsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[1]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}



resource "azurerm_network_security_group" "weu-dev-digital-nsg" {
  provider            = azurerm.weu-dev-digital-sub
  count               = length(local.weu-dev-digital-subnet-name)
  name                = "${local.weu-dev-digital-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.gch-weu-dev-digital-subnet]
  resource_group_name = azurerm_resource_group.gch-rg-weu-dev-digital-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.150.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.dev_digital_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}


resource "azurerm_network_watcher_flow_log" "gch-snet-weu-dev-digital-NSG-flowlog" {
  count                     = length(local.weu-dev-digital-subnet-name)
  provider                  = azurerm.weu-dev-digital-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcherdeveu.name
  resource_group_name       = data.azurerm_network_watcher.nwatcherdeveu.resource_group_name
  name                      = "${local.weu-dev-digital-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-dev-digital-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.gchstorweudsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[1]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}


# // UAT Environment.

resource "azurerm_network_security_group" "weu-uat-bts-nsg" {
  provider            = azurerm.weu-uat-bts-sub
  count               = length(local.weu-uat-bts-subnet-name)
  name                = "${local.weu-uat-bts-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.gch-weu-uat-bts-subnet]
  resource_group_name = azurerm_resource_group.gch-rg-weu-uat-bts-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.140.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.uat_bts_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}


data "azurerm_network_watcher" "nwatcheruateu" {
  provider            = azurerm.weu-uat-bts-sub
  name                = "NetworkWatcher_westeurope"
  resource_group_name = "NetworkWatcherRG"
}

resource "azurerm_network_watcher_flow_log" "gch-snet-weu-uat-bts-NSG-flowlog" {
  count                     = length(local.weu-uat-bts-subnet-name)
  provider                  = azurerm.weu-uat-bts-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcheruateu.name
  resource_group_name       = data.azurerm_network_watcher.nwatcheruateu.resource_group_name
  name                      = "${local.weu-uat-bts-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-uat-bts-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.gchstorweupsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}



resource "azurerm_network_security_group" "weu-uat-digital-nsg" {
  provider            = azurerm.weu-uat-digital-sub
  count               = length(local.weu-uat-digital-subnet-name)
  name                = "${local.weu-uat-digital-subnet-name[count.index]}-nsg"
  location            = var.location-weu
  depends_on          = [azurerm_subnet.gch-weu-uat-digital-subnet]
  resource_group_name = azurerm_resource_group.gch-rg-weu-uat-digital-core-network.name

  security_rule {
    name                       = "Deny_All_Inbound"
    description                = "Deny_All_Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

  }

  # security_rule {
  #   name                       = "keyvault"
  #   description                = "Allow access to Key Vault"
  #   priority                   = 100
  #   direction                  = "Inbound"
  #   access                     = "Allow"
  #   protocol                   = "*"
  #   source_port_range          = "*"
  #   destination_port_range     = "*"
  #   source_address_prefix      = "10.251.148.0/23" # Example: Set the appropriate IP range
  #   destination_address_prefix = "*"               # Example: Set the appropriate IP range
  # }
  tags = local.uat_bts_network_tags
  lifecycle {
    ignore_changes = [
      security_rule,
    ]
  }

}

resource "azurerm_network_watcher_flow_log" "gch-snet-weu-uat-digital-NSG-flowlog" {
  count                     = length(local.weu-uat-digital-subnet-name)
  provider                  = azurerm.weu-uat-digital-sub
  network_watcher_name      = data.azurerm_network_watcher.nwatcheruateu.name
  resource_group_name       = data.azurerm_network_watcher.nwatcheruateu.resource_group_name
  name                      = "${local.weu-uat-digital-subnet-name[count.index]}-nsg-flowlog"
  network_security_group_id = azurerm_network_security_group.weu-uat-digital-nsg[count.index].id
  storage_account_id        = azurerm_storage_account.gchstorweupsecflowlog.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 2
  }
  version = 2

  traffic_analytics {
    enabled               = true
    workspace_id          = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.workspace_id
    workspace_region      = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.location
    workspace_resource_id = data.azurerm_log_analytics_workspace.gch-la-weu-workspace.id
    interval_in_minutes   = 10
  }
  tags = local.security_subscription_tags[local.security-subscription-rg[0]]
  lifecycle {
    ignore_changes = [
      location,
    ]
  }
}






# //weu subnets associations.


resource "azurerm_subnet_network_security_group_association" "weu-prod-management-subnet-nsg" {
  provider                  = azurerm.weu-management-sub
  count                     = length(local.weu-prod-management-subnet_name)
  subnet_id                 = azurerm_subnet.gch-weu-prod-management-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-prod-management-subnet-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-prod-management-subnet-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

resource "azurerm_subnet_network_security_group_association" "weu-dev-management-subnet-nsg" {
  provider                  = azurerm.weu-management-sub
  count                     = length(local.weu-dev-management-subnet_name)
  subnet_id                 = azurerm_subnet.gch-weu-dev-management-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-dev-management-subnet-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-dev-management-subnet-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }

}


resource "azurerm_subnet_network_security_group_association" "weu-prod-identity-subnet-nsg" {
  provider                  = azurerm.weu-identity-sub
  count                     = length(local.weu-prod-identity-subnet_name)
  subnet_id                 = azurerm_subnet.gch-weu-prod-identity-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-prod-identity-subnet-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-prod-identity-subnet-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

# resource "azurerm_subnet_network_security_group_association" "weu-dev-identity-subnet-nsg" {
#   count                     = length(local.weu-dev-identity-subnet_name)
#   subnet_id                 = azurerm_subnet.gch-weu-dev-identity-subnet[count.index].id
#   network_security_group_id = azurerm_network_security_group.weu-dev-identity-subnet-nsg[count.index].id
# }


//weu


resource "azurerm_subnet_network_security_group_association" "weu-prod-bts-nsg" {
  provider                  = azurerm.weu-prod-bts-sub
  count                     = length(local.weu-prod-bts-subnet-name)
  subnet_id                 = azurerm_subnet.gch-weu-prod-bts-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-prod-bts-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-prod-bts-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

resource "azurerm_subnet_network_security_group_association" "weu-prod-digital-nsg" {
  provider                  = azurerm.weu-prod-digital-sub
  count                     = length(local.weu-prod-digital-subnet-name)
  subnet_id                 = azurerm_subnet.gch-weu-prod-digital-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-prod-digital-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-prod-digital-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}



resource "azurerm_subnet_network_security_group_association" "weu-dev-bts-nsg" {
  provider                  = azurerm.weu-dev-bts-sub
  count                     = length(local.weu-dev-bts-subnet-name)
  subnet_id                 = azurerm_subnet.gch-weu-dev-bts-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-dev-bts-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-dev-bts-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

resource "azurerm_subnet_network_security_group_association" "weu-dev-digital-nsg" {
  provider                  = azurerm.weu-dev-digital-sub
  count                     = length(local.weu-dev-digital-subnet-name)
  subnet_id                 = azurerm_subnet.gch-weu-dev-digital-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-dev-digital-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-dev-digital-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}


resource "azurerm_subnet_network_security_group_association" "weu-uat-bts-nsg" {
  provider                  = azurerm.weu-uat-bts-sub
  count                     = length(local.weu-uat-bts-subnet-name)
  subnet_id                 = azurerm_subnet.gch-weu-uat-bts-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-uat-bts-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-uat-bts-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}


resource "azurerm_subnet_network_security_group_association" "weu-uat-digital-nsg" {
  provider                  = azurerm.weu-uat-digital-sub
  count                     = length(local.weu-uat-digital-subnet-name)
  subnet_id                 = azurerm_subnet.gch-weu-uat-digital-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.weu-uat-digital-nsg[count.index].id
  depends_on                = [azurerm_network_security_group.weu-uat-digital-nsg]
  lifecycle {
    ignore_changes = [
      network_security_group_id,
      subnet_id,
    ]
  }
}

