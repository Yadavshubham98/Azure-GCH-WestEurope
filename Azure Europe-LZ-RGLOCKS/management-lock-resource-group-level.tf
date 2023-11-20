data "azurerm_resource_group" "gch-rg-weu-shared-connectivity-core-network" {
  name = "gch-rg-weu-prod-shared-connectivity-core-network"
}


resource "azurerm_management_lock" "resource-group-level-lock23" {
  provider   = azurerm.weu-connectivity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-shared-connectivity-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-dev-shared-management-core-network" {
  provider = azurerm.weu-management-sub
  name     = "gch-rg-weu-dev-shared-management-core-network"
}

resource "azurerm_management_lock" "resource-group-level-lock24" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-management-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-management-core-network" {
  name     = "gch-rg-weu-prod-shared-management-core-network"
  provider = azurerm.weu-management-sub
}

resource "azurerm_management_lock" "resource-group-level-lock25" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-management-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-shared-identity-core-network" {
  name     = "gch-rg-weu-dev-shared-identity-core-network"
  provider = azurerm.weu-identity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock26" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-identity-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-identity-core-network" {
  name     = "gch-rg-weu-prod-shared-identity-core-network"
  provider = azurerm.weu-identity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock27" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-identity-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-bts-core-network" {
  name     = "gch-rg-weu-prod-bts-core-network"
  provider = azurerm.weu-prod-bts-sub
}

resource "azurerm_management_lock" "resource-group-level-lock28" {
  provider   = azurerm.weu-prod-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-bts-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-digital-core-network" {
  name     = "gch-rg-weu-prod-digital-core-network"
  provider = azurerm.weu-prod-digital-sub
}

resource "azurerm_management_lock" "resource-group-level-lock29" {
  provider   = azurerm.weu-prod-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-digital-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-bts-core-network" {
  name     = "gch-rg-weu-dev-bts-core-network"
  provider = azurerm.weu-dev-bts-sub
}

resource "azurerm_management_lock" "resource-group-level-lock30" {
  provider   = azurerm.weu-dev-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-bts-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-dev-digital-core-network" {
  name     = "gch-rg-weu-dev-digital-core-network"
  provider = azurerm.weu-dev-digital-sub
}

resource "azurerm_management_lock" "resource-group-level-lock31" {
  provider   = azurerm.weu-dev-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-digital-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-uat-bts-core-network" {
  name     = "gch-rg-weu-uat-bts-core-network"
  provider = azurerm.weu-uat-bts-sub
}

resource "azurerm_management_lock" "resource-group-level-lock32" {
  provider   = azurerm.weu-uat-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-uat-bts-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-uat-digital-core-network" {
  name     = "gch-rg-weu-uat-digital-core-network"
  provider = azurerm.weu-uat-digital-sub
}

resource "azurerm_management_lock" "resource-group-level-lock33" {
  provider   = azurerm.weu-uat-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-uat-digital-core-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-shared-connectivity-zcc-network" {
  name     = "gch-rg-weu-prod-shared-connectivity-zcc-network"
  provider = azurerm.weu-connectivity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock34" {
  provider   = azurerm.weu-connectivity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-connectivity-zcc-network.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-shared-connectivity-zcc-01" {
  name     = "gch-rg-weu-prod-shared-connectivity-zcc-01"
  provider = azurerm.weu-connectivity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock35" {
  provider   = azurerm.weu-connectivity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-connectivity-zcc-01.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-identity-core-adc" {
  name     = "gch-rg-weu-prod-shared-identity-core-adc"
  provider = azurerm.weu-identity-sub
}

resource "azurerm_management_lock" "resource-group-level-lock36" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-identity-core-adc.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-dev-shared-identity-core-adc" {
  name     = "gch-rg-weu-dev-shared-identity-core-adc"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock37" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-identity-core-adc.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-shared-identity-core-okta" {
  name     = "gch-rg-weu-prod-shared-identity-core-okta"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock38" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-identity-core-okta.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-dev-shared-identity-core-okta" {
  name     = "gch-rg-weu-dev-shared-identity-core-okta"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock39" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-identity-core-okta.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-shared-management-core-lmc" {
  name     = "gch-rg-weu-prod-shared-management-core-lmc"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock40" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-management-core-lmc.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-dev-shared-management-core-lmc" {
  name     = "gch-rg-weu-dev-shared-management-core-lmc"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock41" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-management-core-lmc.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-management-core-jmp" {
  name     = "gch-rg-weu-prod-shared-management-core-jmp"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock42" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-management-core-jmp.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-dev-shared-management-core-jmp" {
  name     = "gch-rg-weu-dev-shared-management-core-jmp"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock43" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-management-core-jmp.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-management-core-zpa" {
  name     = "gch-rg-weu-prod-shared-management-core-zpa"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock44" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-management-core-zpa.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-shared-management-core-zpa" {
  name     = "gch-rg-weu-dev-shared-management-core-zpa"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock45" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-management-core-zpa.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-uat-bts-akv" {
  name     = "gch-rg-weu-uat-bts-akv"
  provider = azurerm.weu-uat-bts-sub
}
resource "azurerm_management_lock" "resource-group-level-lock46" {
  provider   = azurerm.weu-uat-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-uat-bts-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-uat-digital-akv" {
  name     = "gch-rg-weu-uat-digital-akv"
  provider = azurerm.weu-uat-digital-sub
}
resource "azurerm_management_lock" "resource-group-level-lock47" {
  provider   = azurerm.weu-uat-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-uat-digital-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-bts-akv" {
  name     = "gch-rg-weu-prod-bts-akv"
  provider = azurerm.weu-prod-bts-sub
}
resource "azurerm_management_lock" "resource-group-level-lock48" {
  provider   = azurerm.weu-prod-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-bts-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-digital-akv" {
  name     = "gch-rg-weu-prod-digital-akv"
  provider = azurerm.weu-prod-digital-sub
}
resource "azurerm_management_lock" "resource-group-level-lock49" {
  provider   = azurerm.weu-prod-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-digital-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-security-akv" {
  name     = "gch-rg-weu-prod-shared-security-akv"
  provider = azurerm.weu-security-sub

}
resource "azurerm_management_lock" "resource-group-level-lock50" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-security-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-management-akv" {
  name     = "gch-rg-weu-prod-shared-management-akv"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock51" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-management-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-shared-management-akv" {
  name     = "gch-rg-weu-dev-shared-management-akv"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock52" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-management-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-bts-akv" {
  name     = "gch-rg-weu-dev-bts-akv"
  provider = azurerm.weu-dev-bts-sub
}
resource "azurerm_management_lock" "resource-group-level-lock56" {
  provider   = azurerm.weu-dev-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-bts-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-digital-akv" {
  name     = "gch-rg-weu-dev-digital-akv"
  provider = azurerm.weu-dev-digital-sub
}
resource "azurerm_management_lock" "resource-group-level-lock53" {
  provider   = azurerm.weu-dev-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-digital-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-identity-akv" {
  name     = "gch-rg-weu-prod-shared-identity-akv"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock54" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-identity-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-shared-identity-akv" {
  name     = "gch-rg-weu-dev-shared-identity-akv"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock55" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-identity-akv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-management-core-rsv" {
  name     = "gch-rg-weu-prod-shared-management-core-rsv"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock57" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-management-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-dev-shared-management-core-rsv" {
  name     = "gch-rg-weu-dev-shared-management-core-rsv"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock58" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-management-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-shared-identity-core-rsv" {
  name     = "gch-rg-weu-prod-shared-identity-core-rsv"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock59" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-identity-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-dev-shared-identity-core-rsv" {
  name     = "gch-rg-weu-dev-shared-identity-core-rsv"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock60" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-identity-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-bts-core-rsv" {
  name     = "gch-rg-weu-prod-bts-core-rsv"
  provider = azurerm.weu-prod-bts-sub
}
resource "azurerm_management_lock" "resource-group-level-lock61" {
  provider   = azurerm.weu-prod-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-bts-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-digital-core-rsv" {
  name     = "gch-rg-weu-prod-digital-core-rsv"
  provider = azurerm.weu-prod-digital-sub
}
resource "azurerm_management_lock" "resource-group-level-lock62" {
  provider   = azurerm.weu-prod-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-bts-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-bts-core-rsv" {
  name     = "gch-rg-weu-dev-bts-core-rsv"
  provider = azurerm.weu-dev-bts-sub
}
resource "azurerm_management_lock" "resource-group-level-lock63" {
  provider   = azurerm.weu-dev-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-bts-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-dev-digital-core-rsv" {
  name     = "gch-rg-weu-dev-digital-core-rsv"
  provider = azurerm.weu-dev-digital-sub
}
resource "azurerm_management_lock" "resource-group-level-lock64" {
  provider   = azurerm.weu-dev-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-digital-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-uat-bts-core-rsv" {
  name     = "gch-rg-weu-uat-bts-core-rsv"
  provider = azurerm.weu-uat-bts-sub
}
resource "azurerm_management_lock" "resource-group-level-lock65" {
  provider   = azurerm.weu-uat-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-uat-bts-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-uat-digital-core-rsv" {
  name     = "gch-rg-weu-uat-digital-core-rsv"
  provider = azurerm.weu-uat-digital-sub
}
resource "azurerm_management_lock" "resource-group-level-lock66" {
  provider   = azurerm.weu-uat-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-uat-bts-core-rsv.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

// storage RGs locks--------------------------------------

data "azurerm_resource_group" "gch-rg-weu-uat-bts-bootdiag" {
  name     = "gch-rg-weu-uat-bts-bootdiag"
  provider = azurerm.weu-uat-bts-sub
}
resource "azurerm_management_lock" "resource-group-level-lock67" {
  provider   = azurerm.weu-uat-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-uat-bts-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-uat-digital-bootdiag" {
  name     = "gch-rg-weu-uat-digital-bootdiag"
  provider = azurerm.weu-uat-digital-sub
}
resource "azurerm_management_lock" "resource-group-level-lock68" {
  provider   = azurerm.weu-uat-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-uat-digital-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-bts-bootdiag" {
  name     = "gch-rg-weu-prod-bts-bootdiag"
  provider = azurerm.weu-prod-bts-sub
}
resource "azurerm_management_lock" "resource-group-level-lock69" {
  provider   = azurerm.weu-prod-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-bts-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}

data "azurerm_resource_group" "gch-rg-weu-prod-digital-bootdiag" {
  name     = "gch-rg-weu-prod-digital-bootdiag"
  provider = azurerm.weu-prod-digital-sub
}
resource "azurerm_management_lock" "resource-group-level-lock70" {
  provider   = azurerm.weu-prod-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-digital-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-security-bootdiag" {
  name     = "gch-rg-weu-prod-shared-security-bootdiag"
  provider = azurerm.weu-security-sub

}
resource "azurerm_management_lock" "resource-group-level-lock71" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-security-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-management-bootdiag" {
  name     = "gch-rg-weu-prod-shared-management-bootdiag"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock72" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-management-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-shared-management-bootdiag" {
  name     = "gch-rg-weu-dev-shared-management-bootdiag"
  provider = azurerm.weu-management-sub
}
resource "azurerm_management_lock" "resource-group-level-lock73" {
  provider   = azurerm.weu-management-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-management-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-bts-bootdiag" {
  name     = "gch-rg-weu-dev-bts-bootdiag"
  provider = azurerm.weu-dev-bts-sub
}
resource "azurerm_management_lock" "resource-group-level-lock74" {
  provider   = azurerm.weu-dev-bts-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-bts-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-digital-bootdiag" {
  name     = "gch-rg-weu-dev-digital-bootdiag"
  provider = azurerm.weu-dev-digital-sub
}
resource "azurerm_management_lock" "resource-group-level-lock75" {
  provider   = azurerm.weu-dev-digital-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-digital-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-identity-bootdiag" {
  name     = "gch-rg-weu-prod-shared-identity-bootdiag"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock76" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-identity-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-shared-identity-bootdiag" {
  name     = "gch-rg-weu-dev-shared-identity-bootdiag"
  provider = azurerm.weu-identity-sub
}
resource "azurerm_management_lock" "resource-group-level-lock77" {
  provider   = azurerm.weu-identity-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-identity-bootdiag.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-security-analytics-log" {
  name     = "gch-rg-weu-prod-shared-security-analytics-log"
  provider = azurerm.weu-security-sub
}
resource "azurerm_management_lock" "resource-group-level-lock78" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-security-analytics-log.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}



data "azurerm_resource_group" "gch-rg-weu-dev-shared-security-analytics-log" {
  name     = "gch-rg-weu-dev-shared-security-analytics-log"
  provider = azurerm.weu-security-sub
}
resource "azurerm_management_lock" "resource-group-level-lock79" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-security-analytics-log.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-prod-shared-flowlog-storage" {
  name     = "gch-rg-weu-prod-shared-flowlog-storage"
  provider = azurerm.weu-security-sub
}
resource "azurerm_management_lock" "resource-group-level-lock80" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-prod-shared-flowlog-storage.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}


data "azurerm_resource_group" "gch-rg-weu-dev-shared-flowlog-storage" {
  name     = "gch-rg-weu-dev-shared-flowlog-storage"
  provider = azurerm.weu-security-sub
}
resource "azurerm_management_lock" "resource-group-level-lock81" {
  provider   = azurerm.weu-security-sub
  name       = "resource-group-level-lock"
  scope      = data.azurerm_resource_group.gch-rg-weu-dev-shared-flowlog-storage.id
  lock_level = "CanNotDelete"
  notes      = "This resource cannot be deleted"
}
