# generate a random string
# resource "random_string" "suffix" {
#   length = 8
#   upper = false
#   special = false
# }

# Map default tags with values to be assigned to all tagged resources
locals {
  vm_tags = {
    # Owner       = var.owner_tag
    # ManagedBy   = "terraform"
    # Vendor      = "Zscaler"
    # Environment = var.environment
    ApplicationSupport  = "GenpactProxySupport@genpact.com"
    BusinessVertical    = "CorpIT"
    CCCode              = "180"
    Department          = "shared"
    Owner               = "keshav.rajput@genpact.com"
    OwnerSupervisor     = "gaurav.demiwal@genpact.com"
    PID                 = "shared"
    ProjectName         = "GCH Europe Azure Landing Zone"
    ProvisionedBy       = "Terraform"
    ProvisioningSR      = "CHG0079549"
    SDOCode             = "8561"
    Stack               = "Prod"
    supportcost         = "$"
    Backup              = "No"
    Custom-AMI          = "TRUE"
    Exception           = "Yes"
    DeploymentType      = "NN"
    os-support          = "GenpactProxySupport@genpact.com"
    ServiceType         = "IAAS"
    Role                = "Zscaler Cloud Connector"
    InstanceSchedule    = "24*7"
    PatchGroup          = "4th Sat 10:00 AM IST"
    RI                  = "TBD"
    schedulefordeletion = "No"
  }

  rg_tags = {
    ApplicationSupport = "GenpactProxySupport@genpact.com"
    supportcost        = "$"
    BusinessVertical   = "CorpIT"
    ProvisionedBy      = "Terraform"
    ProjectName        = "GCH Europe Azure Landing Zone"
    PID                = "shared"
    SDOCode            = "8561"
    OwnerSupervisor    = "gaurav.demiwal@genpact.com"
    Stack              = "Prod"
    ProvisioningSR     = "CHG0079549"
    CCCode             = "180"
    Owner              = "keshav.rajput@genpact.com"
    Department         = "shared"
  }
}

############################################################################################################################
#### The following lines generates a new SSH key pair and stores the PEM file locally. The public key output is used    ####
#### as the ssh_key passed variable to the cc_vm module for admin_ssh_key public_key authentication                     ####
#### This is not recommended for production deployments. Please consider modifying to pass your own custom              ####
#### public key file located in a secure location                                                                       ####
############################################################################################################################
# private key for login
resource "tls_private_key" "key" {
  algorithm = var.tls_key_algorithm
}

# save the private key
resource "null_resource" "save-key" {
  triggers = {
    key = tls_private_key.key.private_key_pem
  }

  provisioner "local-exec" {
    command = <<EOF
      echo "${tls_private_key.key.private_key_pem}" > ${var.name_prefix}-key.pem
      chmod 0600 ${var.name_prefix}-key.pem
EOF
  }
}

###########################################################################################################################
###########################################################################################################################

## Create the user_data file
locals {
  userdata = <<USERDATA
[ZSCALER]
CC_URL=${var.cc_vm_prov_url}
AZURE_VAULT_URL=${var.azure_vault_url}
HTTP_PROBE_PORT=${var.http_probe_port}
USERDATA
}

resource "local_file" "user-data-file" {
  content  = local.userdata
  filename = "user_data"
}

resource "local_file" "ssh-key" {
  content  = tls_private_key.key.private_key_pem
  filename = "ssh-key.pem"
}



data "azurerm_resource_group" "main" {
  name = "gch-rg-weu-prod-shared-connectivity-zcc-01"
}

# Create Virtual Network
# resource "azurerm_virtual_network" "vnet" {
#   name                = "${var.name_prefix}-vnet-${random_string.suffix.result}"
#   address_space       = [var.network_address_space]
#   location            = var.arm_location
#   resource_group_name = data.azurerm_resource_group.main.name

#   tags = local.global_tags
# }

# # Create Bastion Host public subnet
# resource "azurerm_subnet" "bastion-subnet" {
#   name                 = "${var.name_prefix}-bastion-subnet-${random_string.suffix.result}"
#   resource_group_name  = azurerm_resource_group.main.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = [cidrsubnet(var.network_address_space, 8, 101)]
# }

# # Create Workload Subnet
# resource "azurerm_subnet" "workload-subnet" {
#   name                 = "${var.name_prefix}-workload-subnet-${random_string.suffix.result}"
#   resource_group_name  = azurerm_resource_group.main.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = [cidrsubnet(var.network_address_space, 8, 1)]
# }


# Create Public IPs for NAT Gateways
resource "azurerm_public_ip" "nat-pip" {
  count                   = var.zones_enabled == true ? length(distinct(var.zones)) : 1
  name                    = "gch-pip-weu-prod-zcc-0${count.index + 1}"
  location                = var.arm_location
  resource_group_name     = data.azurerm_resource_group.main.name
  allocation_method       = "Static"
  sku                     = "Standard"
  idle_timeout_in_minutes = 30
  zones                   = local.zones_supported ? [element(var.zones, count.index)] : null

  tags = local.rg_tags
}


# Create NAT Gateways
resource "azurerm_nat_gateway" "nat-gw" {
  count                   = var.zones_enabled == true ? length(distinct(var.zones)) : 1
  name                    = "gch-nat-weu-prod-zcc-0${count.index + 1}"
  location                = var.arm_location
  resource_group_name     = data.azurerm_resource_group.main.name
  idle_timeout_in_minutes = 10
  zones                   = local.zones_supported ? [element(var.zones, count.index)] : null

  tags = local.rg_tags
}


# Associate Public IP to NAT Gateway
resource "azurerm_nat_gateway_public_ip_association" "nat-gw-association1" {
  count                = length(azurerm_nat_gateway.nat-gw.*.id)
  nat_gateway_id       = azurerm_nat_gateway.nat-gw.*.id[count.index]
  public_ip_address_id = azurerm_public_ip.nat-pip.*.id[count.index]

  depends_on = [
    azurerm_public_ip.nat-pip,
    azurerm_nat_gateway.nat-gw
  ]
}

# 2. Create Bastion Host
# module "bastion" {
#   source           = "../modules/terraform-zsbastion-azure"
#   location         = var.arm_location
#   name_prefix      = var.name_prefix
#   resource_tag     = random_string.suffix.result
#   global_tags      = local.global_tags
#   resource_group   = azurerm_resource_group.main.name
#   public_subnet_id = azurerm_subnet.bastion-subnet.id
#   ssh_key          = tls_private_key.key.public_key_openssh
# }

# # 3. Create Workloads
# module "workload" {
#   source         = "../modules/terraform-zsworkload-azure"
#   vm_count       = var.vm_count
#   location       = var.arm_location
#   name_prefix    = var.name_prefix
#   resource_tag   = random_string.suffix.result
#   global_tags    = local.global_tags
#   resource_group = azurerm_resource_group.main.name
#   subnet_id      = azurerm_subnet.workload-subnet.id
#   ssh_key        = tls_private_key.key.public_key_openssh
#   dns_servers    = ["8.8.8.8","8.8.4.4"]
# }

data "azurerm_virtual_network" "vnet" {
  name                = "gch-weu-shared-internet"
  resource_group_name = "gch-rg-weu-prod-shared-connectivity-zcc-network"
}

# 4. Create CC network, routing, and appliance
# Create Cloud Connector Subnets
resource "azurerm_subnet" "cc-subnet" {
  count                = var.zones_enabled == true ? length(distinct(var.zones)) : 1
  name                 = "gch-snet-weu-shared-zcc-app-0${count.index + 1}"
  resource_group_name  = data.azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.cc_subnets != null ? [element(var.cc_subnets, count.index)] : [cidrsubnet(var.network_address_space, 8, count.index + 200)]
}

# data "azurerm_subnet" "example" {
#   name                 = "gch-snet-weu-shared-zcc-app-01"
#   virtual_network_name = "gch-weu-shared-internet"
#   resource_group_name  = "gch-rg-weu-prod-shared-connectivity-core-network"
# }


# Associate Cloud Connector Subnet to NAT Gateway
resource "azurerm_subnet_nat_gateway_association" "subnet-nat-association-ec" {
  count          = var.zones_enabled == true ? length(distinct(var.zones)) : 1
  subnet_id      = azurerm_subnet.cc-subnet[count.index].id
  nat_gateway_id = azurerm_nat_gateway.nat-gw.*.id[count.index]

  depends_on = [
    azurerm_nat_gateway.nat-gw
  ]
}


# Cloud Connector Module variables
# Create X CC VMs per cc_count by default in an availability set for Azure data center fault tolerance.
# Optionally create X CC VMs per cc_count which will span equally across designated availability zones specified in zones_enables
# zones variables.
# E.g. cc_count set to 4 and 2 zones ['1","2"] will create 2x CCs in AZ1 and 2x CCs in AZ2
module "cc-vm" {
  cc_count                              = var.cc_count
  source                                = "../modules/terraform-zscc-azure"
  global_tags                           = local.vm_tags
  resource_group                        = data.azurerm_resource_group.main.name
  mgmt_subnet_id                        = azurerm_subnet.cc-subnet.*.id
  service_subnet_id                     = azurerm_subnet.cc-subnet.*.id
  ssh_key                               = tls_private_key.key.public_key_openssh
  cc_vm_managed_identity_name           = var.cc_vm_managed_identity_name
  cc_vm_managed_identity_resource_group = var.cc_vm_managed_identity_resource_group
  user_data                             = local.userdata
  backend_address_pool                  = module.cc-lb.lb_backend_address_pool
  lb_association_enabled                = true
  location                              = var.arm_location
  zones_enabled                         = var.zones_enabled
  zones                                 = var.zones
  ccvm_instance_type                    = var.ccvm_instance_type
  ccvm_image_publisher                  = var.ccvm_image_publisher
  ccvm_image_offer                      = var.ccvm_image_offer
  ccvm_image_sku                        = var.ccvm_image_sku
  ccvm_image_version                    = var.ccvm_image_version

  depends_on = [
    azurerm_subnet_nat_gateway_association.subnet-nat-association-ec,
    local_file.user-data-file,
  ]
}

# Azure Load Balancer Module variables
module "cc-lb" {
  source            = "../modules/terraform-zslb-azure"
  global_tags       = local.rg_tags
  resource_group    = data.azurerm_resource_group.main.name
  location          = var.arm_location
  subnet_id         = azurerm_subnet.cc-subnet.*.id
  http_probe_port   = var.http_probe_port
  load_distribution = "SourceIP"
  zones             = var.zones
}

# Create Workload Route Table to send to Cloud Connector LB
# resource "azurerm_route_table" "workload-rt" {
#   name                = "${var.name_prefix}-workload-rt-${random_string.suffix.result}"
#   location            = var.arm_location
#   resource_group_name = azurerm_resource_group.main.name

#   disable_bgp_route_propagation = true

#   route {
#     name                   = "default-to-lb"
#     address_prefix         = "0.0.0.0/0"
#     next_hop_type          = "VirtualAppliance"
#     next_hop_in_ip_address = module.cc-lb.lb_ip
#   }
# }

# # Associate Route Table with Workload Subnet
# resource "azurerm_subnet_route_table_association" "server-rt-assoc" {
#   subnet_id      = azurerm_subnet.workload-subnet.id
#   route_table_id = azurerm_route_table.workload-rt.id
# }