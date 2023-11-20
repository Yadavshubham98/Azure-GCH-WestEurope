

resource "azurerm_private_dns_zone" "example" {
  count               = length(local.dns_zones)
  name                = local.dns_zones[count.index]
  resource_group_name = azurerm_resource_group.gch-rg-weu-shared-connectivity-core-network.name
  tags                = local.prod_shared_network_tags
}


