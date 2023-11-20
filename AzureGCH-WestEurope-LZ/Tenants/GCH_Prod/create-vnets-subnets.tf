
# //WUS VNETS
# //Weu Platform VNETs

resource "azurerm_virtual_network" "gch-weu-shared-connectivity" {
  provider            = azurerm.weu-connectivity-sub
  name                = "gch-weu-shared-connectivity"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-shared-connectivity-core-network.name
  address_space       = ["10.251.128.0/23"]
  tags                = local.prod_shared_network_tags

}

resource "azurerm_virtual_network" "gch-weu-shared-internet" {
  provider            = azurerm.weu-connectivity-sub
  name                = "gch-weu-shared-internet"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-prod-shared-connectivity-zcc-network.name
  address_space       = ["10.251.190.0/23"]
  tags                = local.prod_shared_zcc_tags
}

resource "azurerm_virtual_network" "gch-weu-prod-shared-management" {
  provider            = azurerm.weu-management-sub
  name                = "gch-weu-prod-shared-management"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-prod-shared-management-core-network.name
  address_space       = ["10.251.130.0/23"]
  tags                = local.prod_shared_network_tags

}



resource "azurerm_virtual_network" "gch-weu-dev-shared-management" {
  provider            = azurerm.weu-management-sub
  name                = "gch-weu-dev-shared-management"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-dev-shared-management-core-network.name
  address_space       = ["10.251.154.0/23"]
  tags                = local.dev_shared_network_tags
}

resource "azurerm_virtual_network" "gch-weu-prod-shared-identity" {
  provider            = azurerm.weu-identity-sub
  name                = "gch-weu-shared-identity"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-shared-prod-identity-core-network.name
  address_space       = ["10.251.132.0/23"]
  tags                = local.prod_shared_network_tags

}


//*****************************Not Required in GCH as having single domain. ******************************************

# resource "azurerm_virtual_network" "gch-weu-dev-shared-identity" {
#   provider            = azurerm.weu-identity-sub
#   name                = "gch-weu-dev-shared-identity"
#   location            = var.location-weu
#   resource_group_name = azurerm_resource_group.gch-rg-weu-shared-dev-identity-core-network.name
#   address_space       = ["10.251.6.0/23"]
#   tags                = local.paas_tags
# }

//weu Landing Zone VNETS

resource "azurerm_virtual_network" "gch-weu-prod-bts" {
  provider            = azurerm.weu-prod-bts-sub
  name                = "gch-weu-prod-bts"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-prod-bts-core-network.name
  address_space       = ["10.251.136.0/22"]
  tags                = local.prod_bts_network_tags
}

resource "azurerm_virtual_network" "gch-weu-prod-digital" {
  provider            = azurerm.weu-prod-digital-sub
  name                = "gch-weu-prod-digital"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-prod-digital-core-network.name
  address_space       = ["10.251.144.0/22"]
  tags                = local.prod_digital_network_tags

}
resource "azurerm_virtual_network" "gch-weu-dev-bts" {
  provider            = azurerm.weu-dev-bts-sub
  name                = "gch-weu-dev-bts"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-dev-bts-core-network.name
  address_space       = ["10.251.142.0/23"]
  tags                = local.dev_bts_network_tags

}
resource "azurerm_virtual_network" "gch-weu-dev-digital" {
  provider            = azurerm.weu-dev-digital-sub
  name                = "gch-weu-dev-digital"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-dev-digital-core-network.name
  address_space       = ["10.251.150.0/23"]
  tags                = local.dev_digital_network_tags

}
resource "azurerm_virtual_network" "gch-weu-uat-bts" {
  provider            = azurerm.weu-uat-bts-sub
  name                = "gch-weu-uat-bts"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-uat-bts-core-network.name
  address_space       = ["10.251.140.0/23"]
  tags                = local.uat_bts_network_tags

}
resource "azurerm_virtual_network" "gch-weu-uat-digital" {
  provider            = azurerm.weu-uat-digital-sub
  name                = "gch-weu-uat-digital"
  location            = var.location-weu
  resource_group_name = azurerm_resource_group.gch-rg-weu-uat-digital-core-network.name
  address_space       = ["10.251.148.0/23"]
  tags                = local.uat_digital_network_tags

}


// *********************************** WEST EUROPE REGION SUBNETS ***************************

//Create Subnets for Platform Resources East Us region

resource "azurerm_subnet" "gch-weu-prod-management-subnet" {
  provider             = azurerm.weu-management-sub
  count                = length(local.weu-prod-management-subnet_name)
  name                 = local.weu-prod-management-subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.gch-rg-weu-prod-shared-management-core-network.name
  virtual_network_name = azurerm_virtual_network.gch-weu-prod-shared-management.name
  address_prefixes     = [local.weu-prod-management-subnet_address_prefixes[count.index]]
  lifecycle {
    ignore_changes = [service_endpoints]
  }
}
resource "azurerm_subnet" "gch-weu-dev-management-subnet" {
  provider             = azurerm.weu-management-sub
  count                = length(local.weu-dev-management-subnet_name)
  name                 = local.weu-dev-management-subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.gch-rg-weu-dev-shared-management-core-network.name //dev
  virtual_network_name = azurerm_virtual_network.gch-weu-dev-shared-management.name                //dev subnet will be inside prod vnet
  address_prefixes     = [local.weu-dev-management-subnet_address_prefixes[count.index]]
  lifecycle {
    ignore_changes = [
      service_endpoints,
      enforce_private_link_endpoint_network_policies,
    ]
  }
}


resource "azurerm_subnet" "gch-weu-prod-identity-subnet" {
  provider             = azurerm.weu-identity-sub
  count                = length(local.weu-prod-identity-subnet_name)
  name                 = local.weu-prod-identity-subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.gch-rg-weu-shared-prod-identity-core-network.name
  virtual_network_name = azurerm_virtual_network.gch-weu-prod-shared-identity.name
  address_prefixes     = [local.weu-prod-identity-subnet_address_prefixes[count.index]]
  lifecycle {
    ignore_changes = [service_endpoints]
  }
}

# resource "azurerm_subnet" "gch-weu-dev-identity-subnet" {
#   provider             = azurerm.weu-identity-sub
#   count                = length(local.weu-dev-identity-subnet_name)
#   name                 = local.weu-dev-identity-subnet_name[count.index]
#   resource_group_name  = azurerm_resource_group.gch-rg-weu-shared-dev-identity-core-network.name
#   virtual_network_name = azurerm_virtual_network.gch-weu-dev-shared-identity.name
#   address_prefixes     = [local.weu-dev-identity-subnet_address_prefixes[count.index]]
# }

// WEU Region 

resource "azurerm_subnet" "gch-weu-prod-bts-subnet" {
  provider             = azurerm.weu-prod-bts-sub
  count                = length(local.weu-prod-bts-subnet-name)
  name                 = local.weu-prod-bts-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.gch-rg-weu-prod-bts-core-network.name
  virtual_network_name = azurerm_virtual_network.gch-weu-prod-bts.name
  address_prefixes     = [local.weu-prod-bts-subnet[count.index]]
  lifecycle {
    ignore_changes = [service_endpoints]
  }
}
resource "azurerm_subnet" "gch-weu-prod-digital-subnet" {
  provider             = azurerm.weu-prod-digital-sub
  count                = length(local.weu-prod-digital-subnet-name)
  name                 = local.weu-prod-digital-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.gch-rg-weu-prod-digital-core-network.name
  virtual_network_name = azurerm_virtual_network.gch-weu-prod-digital.name
  address_prefixes     = [local.weu-prod-digital-subnet[count.index]]
  lifecycle {
    ignore_changes = [service_endpoints]
  }
}
resource "azurerm_subnet" "gch-weu-dev-bts-subnet" {
  provider             = azurerm.weu-dev-bts-sub
  count                = length(local.weu-dev-bts-subnet-name)
  name                 = local.weu-dev-bts-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.gch-rg-weu-dev-bts-core-network.name
  virtual_network_name = azurerm_virtual_network.gch-weu-dev-bts.name
  address_prefixes     = [local.weu-dev-bts-subnet[count.index]]
  lifecycle {
    ignore_changes = [service_endpoints]
  }
}
resource "azurerm_subnet" "gch-weu-dev-digital-subnet" {
  provider             = azurerm.weu-dev-digital-sub
  count                = length(local.weu-dev-digital-subnet-name)
  name                 = local.weu-dev-digital-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.gch-rg-weu-dev-digital-core-network.name
  virtual_network_name = azurerm_virtual_network.gch-weu-dev-digital.name
  address_prefixes     = [local.weu-dev-digital-subnet[count.index]]
  lifecycle {
    ignore_changes = [service_endpoints]
  }
}
resource "azurerm_subnet" "gch-weu-uat-bts-subnet" {
  provider             = azurerm.weu-uat-bts-sub
  count                = length(local.weu-uat-bts-subnet-name)
  name                 = local.weu-uat-bts-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.gch-rg-weu-uat-bts-core-network.name
  virtual_network_name = azurerm_virtual_network.gch-weu-uat-bts.name
  address_prefixes     = [local.weu-uat-bts-subnet[count.index]]
  lifecycle {
    ignore_changes = [service_endpoints]
  }
}
resource "azurerm_subnet" "gch-weu-uat-digital-subnet" {
  provider             = azurerm.weu-uat-digital-sub
  count                = length(local.weu-uat-digital-subnet-name)
  name                 = local.weu-uat-digital-subnet-name[count.index]
  resource_group_name  = azurerm_resource_group.gch-rg-weu-uat-digital-core-network.name
  virtual_network_name = azurerm_virtual_network.gch-weu-uat-digital.name
  address_prefixes     = [local.weu-uat-digital-subnet[count.index]]
  lifecycle {
    ignore_changes = [service_endpoints]
  }
}
