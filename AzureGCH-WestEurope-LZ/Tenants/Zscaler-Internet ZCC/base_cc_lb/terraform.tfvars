# This is only a sample terraform.tfvars file.
# Uncomment and change the below variables according to your specific environment
# Steps 1-5 required for Cloud Connector (base_cc, base_cc_lb, or cc_lb_custom) deployments

####################################################################################################################
#### Cloud Init Provisioning variables for userdata file  #####
####################################################################################################################
# 1. Zscaler Cloud Connector Provisioning URL E.g. connector.zscaler.net/api/v1/provUrl?name=azure_prov_url

cc_vm_prov_url = "connector.zscalerthree.net/api/v1/provUrl?name=GENPACTAZUREPT"

# 2. Azure Vault URL E.g. "https://zscaler-cc-demo.vault.azure.net"

azure_vault_url = "https://gchakvweupzcc01.vault.azure.net/"

# 3. Cloud Connector cloud init provisioning listener port. This is required for Azure LB Health Probe deployments. 
# Uncomment and set custom probe port to a single value of 80 or any number between 1024-65535. Default is 0/null.

http_probe_port = 50000

####################################################################################################################
#### Prerequisite Provisioned Managed Identity Resource and Resource Group  #####
#### Managed Identity should have GET/LIST access to Key Vault Secrets and  #####
#### Network Contributor Role Assignment to Subscription or RG where Cloud  #####
#### Connectors will be provisioned prior to terraform deployment.          #####
#### (minimum Role permissions: Microsoft.Network/networkInterfaces/read)   ##### 
####################################################################################################################

# 4. Provide your existing Azure Managed Identity name to attach to the CC VM. E.g cloud_connector_managed_identity

cc_vm_managed_identity_name = "gch-mi-weu-prod-zcc"

# 5. Provide the existing Resource Group of the Azure Managed Identity name to attach to the CC VM. E.g. cloud_connector_rg_1

cc_vm_managed_identity_resource_group = "gch-rg-weu-prod-shared-connectivity-zcc-network"



####################################################################################################################
#### Custom variables. Only change if required for your environment  #####
####################################################################################################################

# 6. Azure region where Cloud Connector resources will be deployed. This environment variable is automatically populated if running ZSEC script
#    and thus will override any value set here. Only uncomment and set this value if you are deploying terraform standalone. (Default: westus2)

arm_location = "westeurope"

# 7. IPv4 CIDR configured with VNet creation. Workload, Public, and Cloud Connector Subnets will be created based off this prefix.
#    /24 subnets are created assuming this cidr is a /16. You may need to edit address_prefixes values for subnet creations if
#    desired for smaller or larger subnets. (Default: "10.1.0.0/16")

#    Note: This variable only applies if you let Terraform create a new VNet. Custom deployment with byo_vnet enabled will ignore this

network_address_space = "10.251.190.0/23"



# 8. Cloud Connector Subnet space. (Minimum /28 required. Default: is null. If you do not specify subnets they will  
#    automatically be assigned based on the default cidrsubnet creation within from the VNet address space.
#    Uncomment and modify if byo_vnet is set to true AND you want terraform to create NEW subnets for Cloud Connector
#    in that existing VNET. OR if you choose to modify the address space in the newly created VNet via network_address_space variable change
#    CIDR and mask must be a valid value available within VNet.
#
#    ***** Note *****
#    It does not matter how many subnets you specify here. this script will only create 1 or as many as defined in the zones variable
#    Default/Minumum: 1 - Maximum: 3
#    Example: cc_subnets = ["10.1.150.0/24","10.1.151.0/24"]

# cc_subnets                             = ["10.248.92.0/27","10.248.92.32/27","10.248.92.64/27"]
cc_subnets = ["10.251.190.0/26", "10.251.190.64/26", "10.251.190.128/26"]



# 9. By default, no zones are specified in any resource creation meaning they are either auto-assigned by Azure 
#    (Virtual Machines and NAT Gateways) or Zone-Redundant (Public IP) based on whatever default configuration is.
#    Setting this value to true will do the following:
#    1. will create zonal Public IP Address resources in order of the zones [1-3] specified in zones variable. 1x per zone
#    2. will create zonal NAT Gateway resources in order of the zones [1-3] specified in zones variable. 1x per zone
#    3. will NOT create availability set resource nor associate Cloud Connector VMs to one
#    4. will create zonal Cloud Connector Virtual Machine appliances looping through and alternating per the order of the zones 
#       [1-3] specified in the zones variable AND total number of Cloud Connectors specified in cc_count variable.
#    (Default: false)

zones_enabled = true


# 10. By default, this variable is used as a count (1) for resource creation of Public IP, NAT Gateway, and CC Subnets.
#    This should only be modified if zones_enabled is also set to true
#    Doing so will change the default zone aware configuration for the 3 aforementioned resources with the values specified
#    
#    Use case: Define zone numbers "1" and "2". This will create 2x Public IPs (one in zone 1; the other in zone 2),
#              2x NAT Gateways (one in zone 1; the other in zone 2), associate the zone 1 PIP w/ zone 1 NAT GW and the zone 2
#              PIP w/ zone 2 NAT GW, create 2x CC Subnets and associate subnet 1 w/ zone 1 NAT GW and subnet 2 w/ zone 2 NAT GW,
#              then each CC created will be assigned a zone in the subnet corresponding to the same zone of the NAT GW and PIP associated.

zones = ["1", "2", "3"]


# 11. The number of Cloud Connector appliances to provision. Each incremental Cloud Connector will be created in alternating 
#    subnets based on the zones or byo_subnet_names variable and loop through for any deployments where cc_count > zones.
#    Not configurable for base or base_cc deployment types. (All others - Default: 2)
#    E.g. cc_count set to 4 and 2 zones set ['1","2"] will create 2x CCs in AZ1 and 2x CCs in AZ2

cc_count = 3


# 12. Number of Workload VMs to be provisioned in the workload subnet. Only limitation is available IP space
#    in subnet configuration. Only applicable for "base" deployment types. Default workload subnet is /24 so 250 max

vm_count = 2


# 13. Tag attribute "Owner" assigned to all resoure creation. (Default: "zscc-admin")

owner_tag = "keshav.rajput@genpact.com"



####################################################################################################################
#### Custom BYO variables. Only applicable for "cc_lb_custom" deployment without "base" resource requirements  #####
####################################################################################################################

# 14. By default, this script will create a new Resource Group and place all resources in this group.
#     Uncomment if you want to deploy all resources in an existing Resource Group? (true or false. Default: false)

byo_rg = true


# 15. Provide your existing Resource Group name. Only uncomment and modify if you set byo_rg to true

byo_rg_name = "existing-rg"


# 16. By default, this script will create a new Azure Virtual Network in the default resource group.
#     Uncomment if you want to deploy all resources to a VNet that already exists (true or false. Default: false)

byo_vnet = true


# 17. Provide your existing VNet name. Only uncomment and modify if you set byo_vnet to true

byo_vnet_name = "existing-vnet"


# 18. Provide the existing Resource Group name of your VNet. Only uncomment and modify if you set byo_vnet to true
#     Subnets depend on VNet so the same resource group is implied for subnets

byo_vnet_subnets_rg_name = "existing-vnet-rg"


# 19. By default, this script will create 1 new Azure subnet in the default resource group unles the zones variable
#     specifies multiple zonal deployments in which case subnet 1 would logically map to resources in zone "1", etc.
#     Uncomment if you want to deploy all resources in subnets that already exist (true or false. Default: false)
#     Dependencies require in order to reference existing subnets, the corresponding VNet must also already exist.
#     Setting byo_subnet to true means byo_vnet must ALSO be set to true.

byo_subnets = true


# 20. Provide your existing Cloud Connector subnet names. Only uncomment and modify if you set byo_subnets to true
#     By default, management and service interfaces reside in a single subnet. Therefore, specifying multiple subnets
#     implies only that you are doing a zonal deployment with resources in separate AZs and corresponding zonal NAT
#     Gateway resources associated with the CC subnets mapped to the same respective zones.
#
#     Example: byo_subnet_names = ["subnet-az1","subnet-az2"]

byo_subnet_names = ["existing-cc-subnet"]


# 21. By default, this script will create new Public IP resources to be associated with CC NAT Gateways.
#    Uncomment if you want to use your own public IP for the NAT GW (true or false. Default: false)

byo_pips = true


# 22. Provide your existing Azure Public IP resource names. Only uncomment and modify if you set byo_pips to true
#     Existing Public IP resource cannot be associated with any resource other than an existing NAT Gateway in which
#     case existing_pip_association and existing_nat_gw_association need both set to true
#
#    ***** Note *****
#    If you already have existing PIPs AND set zone_enabled to true, these resource should be configured as zonal and
#    be added here to this variable list in order of the zones specified in the "zones" variable. 
#    Example: byo_pip_names = ["pip-az1","pip-az2"]

byo_pip_names = ["pip-az1", "pip-az2"]


# 23. Provide the existing Resource Group name of your Azure public IPs.  Only uncomment and modify if you set byo_pips to true

byo_pip_rg = "existing-pip-rg"


# 24. By default, this script will create new NAT Gateway resources for the Cloud Connector subnets to be associated
#    Uncomment if you want to use your own NAT Gateway (true or false. Default: false)

byo_nat_gws = true


# 25. Provide your existing Azure NAT Gateway resource names. Only uncomment and modify if you set byo_nat_gws to true
#    ***** Note *****
#    If you already have existing NAT Gateways AND set zone_enabled to true these resource should be configured as zonal and
#    be added here to this variable list in order of the zones specified in the "zones" variable. 
#    Example: byo_nat_gw_names  = ["natgw-az1","natgw-az2"]

byo_nat_gw_names = ["natgw-az1", "natgw-az2"]


# 26. Provide the existing Resource Group name of your NAT Gateway.  Only uncomment and modify if you set byo_nat_gws to true

byo_nat_gw_rg = "existing-nat-gw-rg"


# 27.  By default, this script will create a new Azure Public IP and associate it with new/existing NAT Gateways.
#      Uncomment if you are deploying cloud connector to an environment where the PIP already exists AND is already asssociated to
#      an existing NAT Gateway. (true or false. Default: false). 
#      Setting existing_pip_association to true means byo_nat_gws and byo_pips must ALSO be set to true.

existing_nat_gw_pip_association = true


# 28.  By default this script will create a new Azure NAT Gateway and associate it with new or existing CC subnets.
#      Uncomment if you are deploying cloud connector to an environment where the subnet already exists AND is already asssociated to
#      an existing NAT Gateway. (true or false. Default: false). 
#      Setting existing_nat_gw_association to true means byo_subnets AND byo_nat_gws must also be set to true.

existing_nat_gw_subnet_association = true