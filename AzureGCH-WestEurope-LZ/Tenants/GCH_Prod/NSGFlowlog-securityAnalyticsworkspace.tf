
//weu region

# resource "azurerm_log_analytics_workspace" "gch-la-weu-sec-prod-flowlog" {
#   provider            = azurerm.weu-security-sub
#   name                = "gch-la-weu-prod-flowlog"
#   location            = var.location-weu
#   resource_group_name = local.security-subscription-rg[0]
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
#   tags                = local.security_subscription_tags[local.security-subscription-rg[0]]
# }


# resource "azurerm_log_analytics_workspace" "gch-la-weu-sec-dev-flowlog" {
#   provider            = azurerm.weu-security-sub
#   name                = "gch-la-weu-dev-flowlog"
#   location            = var.location-weu
#   resource_group_name = local.security-subscription-rg[1]
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
#   tags                = local.security_subscription_tags[local.security-subscription-rg[1]]
# }


resource "azurerm_log_analytics_workspace" "gch-la-weu-workspace" {
  provider            = azurerm.weu-security-sub
  name                = "gch-la-weu-workspace"
  location            = var.location-weu
  resource_group_name = local.security-subscription-rg[0]
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.security_subscription_tags[local.security-subscription-rg[0]]
}