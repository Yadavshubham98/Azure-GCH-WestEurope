
# //weu Region
module "gch-rg-weu-prod-shared-identity-dc-servers" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }
  source                           = "../../Modules/Create-Vms"
  resource_group_name              = azurerm_resource_group.weu-identity-rgs[0].name
  vm_hostname                      = "GCHPWWEUAZADC"
  vm_size                          = var.vm_prod_size
  vm_os_publisher                  = var.vm_os_windows_publisher
  vm_os_offer                      = var.vm_os_windows_offer
  vm_os_sku                        = var.vm_os_ad_windows_sku
  vnet_subnet_id                   = azurerm_subnet.gch-weu-prod-identity-subnet[0].id
  enable_ssh_key                   = false
  admin_password                   = var.vm_password
  nb_public_ip                     = 0
  nb_instances                     = 2
  diagnostic_sa                    = azurerm_storage_account.gchstorweupiddiag10.name
  allocation_method                = "Static"
  boot_diagnostics                 = true
  data_disk_size_gb                = 128
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  nb_data_disk                     = 1
  data_sa_type                     = "Premium_LRS"
  tags                             = merge(local.ad-vm-tags, { "PatchGroup" = "4th Sat 10:00 AM IST", "Custom-AMI" = "False", "Role" = "Domain Controller", "os-support" = "genpactcomputewindowsossupport@genpact.com", "OSType" = "Windows" })
  depends_on                       = [azurerm_resource_group.weu-identity-rgs]


}

module "gch-rg-weu-prod-shared-identity-okta-servers" {
  providers = {
    azurerm = azurerm.weu-identity-sub
  }
  source                           = "../../Modules/Create-Vms"
  resource_group_name              = azurerm_resource_group.weu-identity-rgs[1].name
  vm_hostname                      = "GCHPWWEUAZOKT"
  vm_size                          = var.vm_prod_size
  vm_os_publisher                  = var.vm_os_windows_publisher
  vm_os_offer                      = var.vm_os_windows_offer
  vm_os_sku                        = var.vm_os_windows_sku
  vnet_subnet_id                   = azurerm_subnet.gch-weu-prod-identity-subnet[0].id
  enable_ssh_key                   = false
  admin_password                   = var.vm_password
  nb_public_ip                     = 0
  nb_instances                     = 2
  diagnostic_sa                    = azurerm_storage_account.gchstorweupiddiag10.name
  allocation_method                = "Static"
  boot_diagnostics                 = true
  data_disk_size_gb                = 128
  delete_data_disks_on_termination = true
  delete_os_disk_on_termination    = true
  nb_data_disk                     = 1
  data_sa_type                     = "Premium_LRS"
  tags                             = merge(local.okta-vm-tags, { "PatchGroup" = "4th Sat 10:00 AM IST", "Custom-AMI" = "False", "Role" = "Okta agent", "os-support" = "genpactcomputewindowsossupport@genpact.com", "OSType" = "Windows" })
  depends_on                       = [azurerm_resource_group.weu-identity-rgs, azurerm_subnet.gch-weu-prod-identity-subnet]
}
