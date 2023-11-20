

# resource "azurerm_private_dns_zone" "example" {
#   count               = length(local.dns_zones)
#   name                = local.dns_zones[count.index]
#   resource_group_name = azurerm_resource_group.gch-rg-weu-shared-connectivity-core-network.name
#   tags                = local.prod_shared_network_tags
# }


resource "azurerm_private_dns_zone" "weu-pdz" {
  provider            = azurerm.weu-identity-sub
  count               = length(local.dns_zones)
  name                = local.dns_zones[count.index]
  resource_group_name = azurerm_resource_group.weu-private-dns-zone-rgs[0].name
  tags                = local.private_dns_zone_tags[local.private-dns-zone-rg[0]]
}

resource "azurerm_private_dns_zone_virtual_network_link" "weu-pdz-link" {
  provider              = azurerm.weu-identity-sub
  count                 = length(local.dns_zones)
  name                  = "${local.dns_zones[count.index]}-AD-link"
  resource_group_name   = azurerm_resource_group.weu-private-dns-zone-rgs[0].name
  private_dns_zone_name = azurerm_private_dns_zone.weu-pdz[count.index].name
  virtual_network_id    = azurerm_virtual_network.gch-weu-prod-shared-identity.id
}