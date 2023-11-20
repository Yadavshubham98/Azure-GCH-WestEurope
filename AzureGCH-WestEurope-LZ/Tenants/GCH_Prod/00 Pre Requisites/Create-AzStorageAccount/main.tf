resource "random_string" "resource_code" {

  length  = 10
  special = false
  upper   = false
}

resource "azurerm_resource_group" "tfstate-rg" {
  provider = azurerm.terraform-backend
  name     = local.rg-name
  location = local.location
  tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
    "Owner"               = "mohan.kumar@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                 = "shared"
    "Stack"               = "Prod"
    "ProvisionedBy"      = "Terraform"
    "Department"          = "shared"
    "supportcost"         = "$"
  }
}

resource "azurerm_storage_account" "tfstate-str" {
  provider                        = azurerm.terraform-backend
  name                            = "gchstorweupcoretf100"
  resource_group_name             = azurerm_resource_group.tfstate-rg.name
  location                        = azurerm_resource_group.tfstate-rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false

  enable_https_traffic_only       = true
  
  blob_properties {
    versioning_enabled = true
  }
  tags = {
    "Exception"          = "No"
    "Name"               = "gchstorweupcoretfstate100"
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
    "Owner"               = "mohan.kumar@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "shared"
    "Stack"              = "Prod"
    "ProvisionedBy"      = "Terraform"
    "Department"         = "shared"
    "supportcost"        = "$"
  }
}

resource "azurerm_storage_container" "tfstate" {
  provider              = azurerm.terraform-backend
  name                  = "tfstate-container"
  storage_account_name  = azurerm_storage_account.tfstate-str.name
  container_access_type = "private"
}

resource "azurerm_management_lock" "resource-group-level" {
  provider   = azurerm.terraform-backend
  name       = "resource-group-level"
  scope      = azurerm_resource_group.tfstate-rg.id
  lock_level = "CanNotDelete"
  notes      = "This Resource Group cannot be deleted"
}

