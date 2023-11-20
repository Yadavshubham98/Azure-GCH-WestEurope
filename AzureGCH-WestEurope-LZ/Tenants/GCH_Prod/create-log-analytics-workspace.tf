
# //weu region
# resource "azurerm_log_analytics_workspace" "gch-la-weu-core-01" {
#   provider            = azurerm.weu-management-sub
#   name                = "gch-la-weu-core-01"
#   location            = var.location-weu
#   resource_group_name = azurerm_resource_group.weu-la-workspace-rg.name
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
#   tags                = local.prod_log_tags
# }
