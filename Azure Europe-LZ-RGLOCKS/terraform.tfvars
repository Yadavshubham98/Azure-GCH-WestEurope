tenant_id                     = "958a7efb-f2a7-4ea2-80ee-85fc8ed01be7"
managed_identity_principal_id = "cba497a2-358b-47f2-b23b-083b74de4fc3" //object id of the managed identity
vm_password                   = "Zaq12wsxcde3!!!"

//default Azure regions for deployment of resources
location-ind = "centralindia"
location-weu = "westeurope"
location-eus = "eastus"
location-wus = "westus2"


//VM OS variables
vm_os_linux_publisher = "RedHat"
vm_os_linux_offer     = "RHEL"
vm_os_linux_sku       = "8.2"

vm_os_linux_zscaler_publisher = "zscaler"
vm_os_linux_zscaler_offer     = "zscaler-private-access"
vm_os_linux_zscaler_sku       = "zpa-con-azure"

vm_os_windows_publisher = "MicrosoftWindowsServer"
vm_os_windows_offer     = "WindowsServer"
vm_os_windows_sku       = "2019-Datacenter"

vm_os_ad_windows_sku = "2016-Datacenter"

//VM size for Dev and Prod
vm_prod_size = "Standard_B4ms"
vm_dev_size  = "Standard_B4ms"


