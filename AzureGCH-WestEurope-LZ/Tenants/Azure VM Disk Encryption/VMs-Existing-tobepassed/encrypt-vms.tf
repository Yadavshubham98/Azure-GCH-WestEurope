# # /* IMPORTANT: Run this code ONLY when the following resources are already created
# #       - Azure VM
# #       - Azure Keyvault
# #       - Azure Keyvault keys

# # */

# //WEU Prod Servers

module "encrypt-weu-prod-servers-linuxjmp" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }

  source  = "../Modules/Disk-Encryption"
  vm_list = ["GCHPLWEUAZJMP01", "GCHPLWEUAZJMP02"]
  vm_rg   = "gch-rg-weu-prod-shared-management-core-jmp"
  # keyvault_rg   = azurerm_resource_group.weu-akv-rgs[5].name
  keyvault_rg   = "gch-rg-weu-prod-shared-management-akv"
  keyvault_name = "gchakvweupmgmtencrpt-10"
  kek_name      = "vm-key-weu-prod-mgmt-01"
  os_version    = "Linux"

}



# module "encrypt-weu-dev-servers-linuxjmp" {
#   providers = {
#     azurerm = azurerm.weu-management-sub
#   }
#   source  = "../Modules/Disk-Encryption"
#   vm_list = ["GCHDLWEUAZJMP01"]
#   vm_rg   = "gch-rg-weu-dev-shared-management-core-jmp"
#   # keyvault_rg   = azurerm_resource_group.weu-akv-rgs[5].name
#   keyvault_rg   = "gch-rg-weu-dev-shared-management-akv"
#   keyvault_name = "gchakvweudmgmtencrpt-10"
#   kek_name      = "vm-key-weu-dev-mgmt-01"
#   os_version    = "Linux"
# }

module "encrypt-weu-prod-servers-windowsjmp" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }

  source  = "../Modules/Disk-Encryption"
  vm_list = ["GCHPWWEUAZJMP01", "GCHPWWEUAZJMP02"]
  vm_rg   = "gch-rg-weu-prod-shared-management-core-jmp"
  # keyvault_rg   = azurerm_resource_group.weu-akv-rgs[5].name
  keyvault_rg   = "gch-rg-weu-prod-shared-management-akv"
  keyvault_name = "gchakvweupmgmtencrpt-10"
  kek_name      = "vm-key-weu-prod-mgmt-01"
  os_version    = "WindowsServer"

}

module "encrypt-weu-dev-servers-windowsjmp" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }

  source  = "../Modules/Disk-Encryption"
  vm_list = ["GCHDWWEUAZJMP01"]
  vm_rg   = "gch-rg-weu-dev-shared-management-core-jmp"
  # keyvault_rg   = azurerm_resource_group.weu-akv-rgs[5].name
  keyvault_rg   = "gch-rg-weu-dev-shared-management-akv"
  keyvault_name = "gchakvweudmgmtencrpt-10"
  kek_name      = "vm-key-weu-dev-mgmt-01"
  os_version    = "WindowsServer"

}

module "encrypt-weu-prod-servers-windowslmc" {
  providers = {
    azurerm = azurerm.weu-management-sub
  }

  source  = "../Modules/Disk-Encryption"
  vm_list = ["GCHPWWEUAZLMC01"]
  vm_rg   = "gch-rg-weu-prod-shared-management-core-lmc"
  # keyvault_rg   = azurerm_resource_group.weu-akv-rgs[5].name
  keyvault_rg   = "gch-rg-weu-prod-shared-management-akv"
  keyvault_name = "gchakvweupmgmtencrpt-10"
  kek_name      = "vm-key-weu-prod-mgmt-01"
  os_version    = "WindowsServer"

}

module "encrypt-weu-prod-servers-windowsdc" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }

  source  = "../Modules/Disk-Encryption"
  vm_list = ["GCHPWWEUAZADC01", "GCHPWWEUAZADC02"]
  vm_rg   = "gch-rg-weu-prod-shared-identity-core-adc"
  # keyvault_rg   = azurerm_resource_group.weu-akv-rgs[5].name
  keyvault_rg   = "gch-rg-weu-prod-shared-identity-akv"
  keyvault_name = "gchakvweupidencrpt-10"
  kek_name      = "vm-key-weu-prod-identity-01"
  os_version    = "WindowsServer"

}

module "encrypt-weu-prod-servers-windowsokta" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }

  source  = "../Modules/Disk-Encryption"
  vm_list = ["GCHPWWEUAZOKT01", "GCHPWWEUAZOKT02"]
  vm_rg   = "gch-rg-weu-prod-shared-identity-core-okta"
  # keyvault_rg   = azurerm_resource_group.weu-akv-rgs[5].name
  keyvault_rg   = "gch-rg-weu-prod-shared-identity-akv"
  keyvault_name = "gchakvweupidencrpt-10"
  kek_name      = "vm-key-weu-prod-identity-01"
  os_version    = "WindowsServer"

}


# module "encrypt-weu-prod-servers-linuxzpa" {
#   providers = {
#     azurerm = azurerm.weu-management-sub
#   }

#   source  = "../Modules/Disk-Encryption"
#   vm_list = ["GCHPLWEUAZZPA01", "GCHPLWEUAZZPA02"]
#   vm_rg   = "gch-rg-weu-prod-shared-management-core-zpa"
#   # keyvault_rg   = azurerm_resource_group.weu-akv-rgs[5].name
#   keyvault_rg   = azurerm_resource_group.weu-prod-shared-management-akv-rg.name
#   keyvault_name = "gchakvweupmgmtencrpt-10"
#   kek_name      = "vm-key-weu-prod-mgmt-01"
#   os_version    = "Linux"
# }


