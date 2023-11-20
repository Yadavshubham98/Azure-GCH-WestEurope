data "azurerm_resource_group" "main" {
  name = "gch-rg-eus-prod-shared-connectivity-core-network"
}
data "azurerm_virtual_wan" "euswan" {
  name                = "gch-vwan-eus-shared"
  resource_group_name = "gch-rg-eus-prod-shared-connectivity-core-network"
}


//Provision regional VWAN Hubs
resource "azurerm_virtual_hub" "gch-weu-prod-hub" {
  provider            = azurerm.weu-connectivity-sub
  name                = "gch-vhub-weu-shared"
  resource_group_name = data.azurerm_resource_group.main.name
  location            = var.location-weu
  virtual_wan_id      = data.azurerm_virtual_wan.euswan.id
  address_prefix      = "10.251.186.0/23"
  tags                = local.prod_shared_network_tags
  lifecycle  {
    ignore_changes = [
      virtual_wan_id,
    ]
  }
}


# //VHUB Connections - WEU HUB

resource "azurerm_virtual_hub_connection" "vhub-weu-prod-shared-management" {
  name                      = "gch-weu-prod-shared-management-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-prod-shared-management.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}



resource "azurerm_virtual_hub_connection" "vhub-weu-dev-shared-management" {
  name                      = "gch-weu-dev-shared-management-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-dev-shared-management.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}


resource "azurerm_virtual_hub_connection" "vhub-gch-weu-prod-shared-identity" {
  name                      = "gch-weu-prod-shared-identity-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-prod-shared-identity.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}


//Landing Zones
resource "azurerm_virtual_hub_connection" "vhub-gch-weu-prod-digital" {
  name                      = "gch-weu-prod-digital-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-prod-digital.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-gch-weu-prod-bts" {
  name                      = "gch-weu-prod-bts-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-prod-bts.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-gch-weu-dev-bts" {
  name                      = "gch-weu-dev-bts-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-dev-bts.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-gch-weu-dev-digital" {
  name                      = "gch-weu-dev-digital-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-dev-digital.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-gch-weu-uat-bts" {
  name                      = "gch-weu-uat-bts-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-uat-bts.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}
resource "azurerm_virtual_hub_connection" "vhub-gch-weu-uat-digital" {
  name                      = "gch-weu-uat-digital-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-uat-digital.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}



resource "azurerm_virtual_hub_connection" "vhub-gch-weu-shared-security" {
  name                      = "gch-weu-shared-security-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-shared-connectivity.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}

resource "azurerm_virtual_hub_connection" "vhub-gch-weu-shared-internet" {
  name                      = "gch-weu-shared-internet-connection"
  virtual_hub_id            = azurerm_virtual_hub.gch-weu-prod-hub.id
  remote_virtual_network_id = azurerm_virtual_network.gch-weu-shared-internet.id
  lifecycle {
    ignore_changes = [
      remote_virtual_network_id,  
      internet_security_enabled,
    ]
  }
}