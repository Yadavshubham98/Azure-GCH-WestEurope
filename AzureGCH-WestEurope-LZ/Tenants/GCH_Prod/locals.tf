//REQUIRED - Set individual subscription_ids for each platform/landing zone

locals {
  //Local variables for Subscription IDs

  # platform-ind-connectivity-sub = "72452951-68DC-409E-9588-6F0A85306411"
  # platform-ind-identity-sub     = "D6A7DB39-1660-4DF6-AADC-2D38A854B99C"
  # platform-ind-management-sub   = "F2A95892-5BBA-4865-A996-B298C52024B2"
  # platform-ind-security-sub     = "127a1a99-4e48-4b64-b7a2-4e351019163f"
  # platform-neu-connectivity-sub = "72452951-68DC-409E-9588-6F0A85306411"
  # platform-neu-identity-sub     = "D6A7DB39-1660-4DF6-AADC-2D38A854B99C"
  # platform-neu-management-sub   = "F2A95892-5BBA-4865-A996-B298C52024B2"
  # platform-neu-security-sub     = "127a1a99-4e48-4b64-b7a2-4e351019163f"
  platform-weu-connectivity-sub = "72452951-68DC-409E-9588-6F0A85306411"
  platform-weu-identity-sub     = "D6A7DB39-1660-4DF6-AADC-2D38A854B99C"
  platform-weu-management-sub   = "F2A95892-5BBA-4865-A996-B298C52024B2"
  platform-weu-security-sub     = "127a1a99-4e48-4b64-b7a2-4e351019163f"
  # platform-wus-connectivity-sub = "72452951-68DC-409E-9588-6F0A85306411"
  # platform-wus-identity-sub     = "D6A7DB39-1660-4DF6-AADC-2D38A854B99C"
  # platform-wus-management-sub   = "F2A95892-5BBA-4865-A996-B298C52024B2"
  # platform-wus-security-sub     = "127a1a99-4e48-4b64-b7a2-4e351019163f"

  //Landing Zone Subscriptions
  # ind-prod-digital-sub = "48C2A0CA-74F0-4FAE-A460-5941D0AD502E"
  # ind-prod-bts-sub     = "48C2A0CA-74F0-4FAE-A460-5941D0AD502E"
  # ind-dev-digital-sub  = "7A550D17-AD13-40C9-AB32-8806ADD577B1"
  # ind-dev-bts-sub      = "7A550D17-AD13-40C9-AB32-8806ADD577B1"
  # ind-uat-digital-sub  = "5667AEE7-BB6E-45C6-9CB4-C8A21317AE2C"
  # ind-uat-bts-sub      = "5667AEE7-BB6E-45C6-9CB4-C8A21317AE2C"

  weu-prod-digital-sub = "66E479FA-A9F2-45B2-933A-41FA072982AD"
  weu-prod-bts-sub     = "66E479FA-A9F2-45B2-933A-41FA072982AD"
  weu-dev-digital-sub  = "668A93BB-CC10-4C83-9333-27DE94B10E34"
  weu-dev-bts-sub      = "668A93BB-CC10-4C83-9333-27DE94B10E34"
  weu-uat-digital-sub  = "60B7671B-C381-4360-B07D-86E650BA76B9"
  weu-uat-bts-sub      = "60B7671B-C381-4360-B07D-86E650BA76B9"


  genpact-cloud-hosting-sub = "de52f15e-9c68-4673-b173-9de91aa89657"

  # neu-prod-digital-sub = "66E479FA-A9F2-45B2-933A-41FA072982AD"
  # neu-prod-bts-sub     = "66E479FA-A9F2-45B2-933A-41FA072982AD"
  # neu-dev-digital-sub  = "668A93BB-CC10-4C83-9333-27DE94B10E34"
  # neu-dev-bts-sub      = "668A93BB-CC10-4C83-9333-27DE94B10E34"
  # neu-uat-digital-sub  = "60B7671B-C381-4360-B07D-86E650BA76B9"
  # neu-uat-bts-sub      = "60B7671B-C381-4360-B07D-86E650BA76B9"

  # eus-prod-digital-sub = "1B5E485A-8825-4549-9EAA-D87817D92FC2"
  # eus-prod-bts-sub     = "1B5E485A-8825-4549-9EAA-D87817D92FC2"
  # eus-dev-digital-sub  = "0E2E9ECD-C8A0-4202-A528-F58DD69ADD16"
  # eus-dev-bts-sub      = "0E2E9ECD-C8A0-4202-A528-F58DD69ADD16"
  # eus-uat-digital-sub  = "9CF01E3F-45CE-4303-B8A6-E653208AB130"
  # eus-uat-bts-sub      = "9CF01E3F-45CE-4303-B8A6-E653208AB130"

  # wus-prod-digital-sub = "1B5E485A-8825-4549-9EAA-D87817D92FC2"
  # wus-prod-bts-sub     = "1B5E485A-8825-4549-9EAA-D87817D92FC2"
  # wus-dev-digital-sub  = "0E2E9ECD-C8A0-4202-A528-F58DD69ADD16"
  # wus-dev-bts-sub      = "0E2E9ECD-C8A0-4202-A528-F58DD69ADD16"
  # wus-uat-digital-sub  = "9CF01E3F-45CE-4303-B8A6-E653208AB130"
  # wus-uat-bts-sub      = "9CF01E3F-45CE-4303-B8A6-E653208AB130"
  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}

locals {
  backup-service-object-id = "f06682ba-bb51-4f99-890d-59238c499bdc"
}



################################## Start of Local variables for all resources



locals {

  //Resource Groups for Identity environments
  ind-identity-rgs = ["gch-rg-ind-prod-shared-identity-core-adc", "gch-rg-ind-prod-shared-identity-core-okta", "gch-rg-ind-dev-shared-identity-core-adc", "gch-rg-ind-dev-shared-identity-core-okta"]
  neu-identity-rgs = ["gch-rg-neu-prod-shared-identity-core-adc", "gch-rg-neu-prod-shared-identity-core-okta", "gch-rg-neu-dev-shared-identity-core-adc", "gch-rg-neu-dev-shared-identity-core-okta"]
  wus-identity-rgs = ["gch-rg-wus-prod-shared-identity-core-adc", "gch-rg-wus-prod-shared-identity-core-okta", "gch-rg-wus-dev-shared-identity-core-adc", "gch-rg-wus-dev-shared-identity-core-okta"]
  weu-identity-rgs = ["gch-rg-weu-prod-shared-identity-core-adc", "gch-rg-weu-prod-shared-identity-core-okta", "gch-rg-weu-dev-shared-identity-core-adc", "gch-rg-weu-dev-shared-identity-core-okta"]

  //Resource Groups for ZScalers Management environments
  ind-zpa-rgs = ["gch-rg-ind-prod-shared-management-core-zpa", "gch-rg-ind-dev-shared-management-core-zpa"]
  neu-zpa-rgs = ["gch-rg-neu-prod-shared-management-core-zpa", "gch-rg-neu-dev-shared-management-core-zpa"]
  wus-zpa-rgs = ["gch-rg-wus-prod-shared-management-core-zpa", "gch-rg-wus-dev-shared-management-core-zpa"]
  weu-zpa-rgs = ["gch-rg-weu-prod-shared-management-core-zpa", "gch-rg-weu-dev-shared-management-core-zpa"]

  //Resource Groups for Mgmt
  ind-mgmt-rgs = ["gch-rg-ind-dev-shared-management-core-network", "gch-rg-ind-prod-shared-management-core-network"]
  weu-mgmt-rgs = ["gch-rg-weu-dev-shared-management-core-network", "gch-rg-weu-prod-shared-management-core-network"]
  wus-mgmt-rgs = ["gch-rg-wus-dev-shared-management-core-network", "gch-rg-wus-prod-shared-management-core-network"]
  neu-mgmt-rgs = ["gch-rg-neu-dev-shared-management-core-network", "gch-rg-neu-prod-shared-management-core-network"]

  //Resource Groups for Logic Monitor
  ind-lmc-rgs = ["gch-rg-ind-prod-shared-management-core-lmc", "gch-rg-ind-dev-shared-management-core-lmc"]
  neu-lmc-rgs = ["gch-rg-neu-prod-shared-management-core-lmc", "gch-rg-neu-dev-shared-management-core-lmc"]
  wus-lmc-rgs = ["gch-rg-wus-prod-shared-management-core-lmc", "gch-rg-wus-dev-shared-management-core-lmc"]
  weu-lmc-rgs = ["gch-rg-weu-prod-shared-management-core-lmc", "gch-rg-weu-dev-shared-management-core-lmc"]

  //Resource Groups for Jump Servers
  ind-jmp-rgs = ["gch-rg-ind-prod-shared-management-core-jmp", "gch-rg-ind-dev-shared-management-core-jmp"]
  weu-jmp-rgs = ["gch-rg-weu-prod-shared-management-core-jmp", "gch-rg-weu-dev-shared-management-core-jmp"]
  wus-jmp-rgs = ["gch-rg-wus-prod-shared-management-core-jmp", "gch-rg-wus-dev-shared-management-core-jmp"]
  neu-jmp-rgs = ["gch-rg-neu-prod-shared-management-core-jmp", "gch-rg-neu-dev-shared-management-core-jmp"]

  //Resource Groups for Keyvault Services

  # ind-akv-rgs = ["gch-rg-ind-prod-shared-management-core-akv", "gch-rg-ind-dev-shared-management-core-akv"]
  weu-akv-rgs = ["gch-rg-weu-uat-bts-akv", "gch-rg-weu-uat-digital-akv", "gch-rg-weu-prod-bts-akv", "gch-rg-weu-prod-digital-akv", "gch-rg-weu-prod-shared-security-akv", "gch-rg-weu-prod-shared-management-akv", "gch-rg-weu-dev-shared-management-akv", "gch-rg-weu-dev-bts-akv", "gch-rg-weu-dev-digital-akv", "gch-rg-weu-prod-shared-identity-akv", "gch-rg-weu-dev-shared-identity-akv"]
  ind-akv-rgs = ["gch-rg-ind-prod-shared-management-core-akv", "gch-rg-ind-dev-shared-management-core-akv"]
  wus-akv-rgs = ["gch-rg-wus-prod-shared-management-core-akv", "gch-rg-wus-dev-shared-management-core-akv"]
  neu-akv-rgs = ["gch-rg-neu-prod-shared-management-core-akv", "gch-rg-neu-dev-shared-management-core-akv"]

  //Resource Groups for Recovey Services Vault

  weu-rsv-rgs          = ["gch-rg-weu-prod-shared-management-core-rsv", "gch-rg-weu-dev-shared-management-core-rsv"]
  weu-rsv-identity-rgs = ["gch-rg-weu-prod-shared-identity-core-rsv", "gch-rg-weu-dev-shared-identity-core-rsv"]

  weu-rsv-prod-rgs = ["gch-rg-weu-prod-bts-core-rsv", "gch-rg-weu-prod-digital-core-rsv"]
  weu-rsv-dev-rgs  = ["gch-rg-weu-dev-bts-core-rsv", "gch-rg-weu-dev-digital-core-rsv"]
  weu-rsv-uat-rgs  = ["gch-rg-weu-uat-bts-core-rsv", "gch-rg-weu-uat-digital-core-rsv"]
  #weu-rsv-security= ["gch-rg-weu-shared-security-core-rsv"]

  neu-rsv-rgs = ["gch-rg-neu-prod-shared-management-core-rsv", "gch-rg-neu-dev-shared-management-core-rsv"]
  ind-rsv-rgs = ["gch-rg-ind-prod-shared-management-core-rsv", "gch-rg-ind-dev-shared-management-core-rsv"]
  wus-rsv-rgs = ["gch-rg-wus-prod-shared-management-core-rsv", "gch-rg-wus-dev-shared-management-core-rsv"]

  //Resource Groups for Boot Diagnostics

  # weu-bootdiag-rgs = ["gch-rg-weu-prod-shared-boot-diag", "gch-rg-weu-dev-shared-boot-diag", "gch-rg-weu-prod-digital-boot-diag", "gch-rg-weu-prod-bts-boot-diag", "gch-rg-weu-dev-digital-boot-diag", "gch-rg-weu-dev-bts-boot-diag"]
  weu-bootdiag-rgs = ["gch-rg-weu-uat-bts-bootdiag", "gch-rg-weu-uat-digital-bootdiag", "gch-rg-weu-prod-bts-bootdiag", "gch-rg-weu-prod-digital-bootdiag", "gch-rg-weu-prod-shared-security-bootdiag", "gch-rg-weu-prod-shared-management-bootdiag", "gch-rg-weu-dev-shared-management-bootdiag", "gch-rg-weu-dev-bts-bootdiag", "gch-rg-weu-dev-digital-bootdiag", "gch-rg-weu-prod-shared-identity-bootdiag", "gch-rg-weu-dev-shared-identity-bootdiag"]
  neu-bootdiag-rgs = ["gch-rg-neu-prod-shared-boot-diag", "gch-rg-neu-dev-shared-boot-diag", "gch-rg-neu-prod-digital-boot-diag", "gch-rg-neu-prod-bts-boot-diag", "gch-rg-neu-dev-digital-boot-diag", "gch-rg-neu-dev-bts-boot-diag"]
  wus-bootdiag-rgs = ["gch-rg-wus-prod-shared-boot-diag", "gch-rg-wus-dev-shared-boot-diag", "gch-rg-wus-prod-digital-boot-diag", "gch-rg-wus-prod-bts-boot-diag", "gch-rg-wus-dev-digital-boot-diag", "gch-rg-wus-dev-bts-boot-diag"]
  ind-bootdiag-rgs = ["gch-rg-ind-prod-shared-boot-diag", "gch-rg-ind-dev-shared-boot-diag", "gch-rg-ind-prod-digital-boot-diag", "gch-rg-ind-prod-bts-boot-diag", "gch-rg-ind-dev-digital-boot-diag", "gch-rg-ind-dev-bts-boot-diag"]

  //Resource Groups for Prod Regional Log Analytics
  security-subscription-rg   = ["gch-rg-weu-prod-shared-security-analytics-log", "gch-rg-weu-dev-shared-security-analytics-log", "gch-rg-weu-prod-shared-flowlog-storage", "gch-rg-weu-dev-shared-flowlog-storage"]
  private-dns-zone-rg        = ["gch-rg-weu-shared-private-dns-zone"]
  all-regions-laworkspace-rg = ["gch-rg-ind-prod-shared-manssagement-core-log", "gch-rg-neu-prod-shared-management-core-log", "gch-rg-weu-prod-shared-management-core-log", "gch-rg-wus-prod-shared-management-core-log"]

}
locals {

  //Local variables for Azure subnets and subnet names

  # ind-prod-management-subnet_name             = ["gch-snet-ind-prod-mgmt-private-01", "gch-snet-ind-prod-mgmt-public-01", "gch-snet-ind-prod-mgmt-db-01"]
  # ind-prod-management-subnet_address_prefixes = ["10.248.0.0/26", "10.248.0.64/26", "10.248.0.128/26"]

  # ind-dev-management-subnet_name             = ["gch-snet-ind-dev-mgmt-private-01", "gch-snet-ind-dev-mgmt-public-01", "gch-snet-ind-dev-mgmt-db-01"]
  # ind-dev-management-subnet_address_prefixes = ["10.248.2.0/26", "10.248.2.64/26", "10.248.2.128/26"]

  # ind-prod-identity-subnet_name             = ["gch-snet-ind-prod-identity-private-01", "gch-snet-ind-prod-identity-public-01", "gch-snet-ind-prod-identity-db-01"]
  # ind-prod-identity-subnet_address_prefixes = ["10.248.4.0/26", "10.248.4.64/26", "10.248.4.128/26"]

  # ind-dev-identity-subnet_name             = ["gch-snet-ind-dev-identity-private-01", "gch-snet-ind-dev-identity-public-01", "gch-snet-ind-dev-identity-db-01"]
  # ind-dev-identity-subnet_address_prefixes = ["10.248.6.0/26", "10.248.6.64/26", "10.248.6.128/26"]

  weu-prod-management-subnet_name             = ["gch-snet-weu-prod-shared-mgmt-private-01", "gch-snet-weu-prod-shared-mgmt-public-01", "gch-snet-weu-prod-shared-mgmt-db-01"]
  weu-prod-management-subnet_address_prefixes = ["10.251.130.0/26", "10.251.130.64/26", "10.251.130.128/26"]

  weu-dev-management-subnet_name             = ["gch-snet-weu-dev-shared-mgmt-private-01", "gch-snet-weu-dev-shared-mgmt-public-01", "gch-snet-weu-dev-shared-mgmt-db-01"]
  weu-dev-management-subnet_address_prefixes = ["10.251.154.0/26", "10.251.154.64/26", "10.251.154.128/26"]

  weu-prod-identity-subnet_name             = ["gch-snet-weu-shared-identity-private-01", "gch-snet-weu-shared-identity-public-01", "gch-snet-weu-shared-identity-db-01"]
  weu-prod-identity-subnet_address_prefixes = ["10.251.132.0/26", "10.251.132.64/26", "10.251.132.128/26"]

  weu-dev-identity-subnet_name             = ["gch-snet-weu-dev-shared-identity-private-01", "gch-snet-weu-dev-shared-identity-public-01", "gch-snet-weu-dev-shared-identity-db-01"]
  weu-dev-identity-subnet_address_prefixes = ["10.251.133.0/26", "10.251.133.64/26", "10.251.133.128/26"]

  # wus-prod-management-subnet_name             = ["gch-snet-wus-prod-mgmt-private-01", "gch-snet-wus-prod-mgmt-public-01", "gch-snet-wus-prod-mgmt-db-01"]
  # wus-prod-management-subnet_address_prefixes = ["10.250.0.0/26", "10.250.0.64/26", "10.250.0.128/26"]

  # wus-dev-management-subnet_name             = ["gch-snet-wus-dev-mgmt-private-01", "gch-snet-wus-dev-mgmt-public-01", "gch-snet-wus-dev-mgmt-db-01"]
  # wus-dev-management-subnet_address_prefixes = ["10.250.2.0/26", "10.250.2.64/26", "10.250.2.128/26"]

  # wus-prod-identity-subnet_name             = ["gch-snet-wus-prod-identity-private-01", "gch-snet-wus-prod-identity-public-01", "gch-snet-wus-prod-identity-db-01"]
  # wus-prod-identity-subnet_address_prefixes = ["10.250.4.0/26", "10.250.4.64/26", "10.250.4.128/26"]

  # wus-dev-identity-subnet_name             = ["gch-snet-wus-dev-identity-private-01", "gch-snet-wus-dev-identity-public-01", "gch-snet-wus-dev-identity-db-01"]
  # wus-dev-identity-subnet_address_prefixes = ["10.250.6.0/26", "10.250.6.64/26", "10.250.6.128/26"]

  # neu-prod-management-subnet_name             = ["gch-snet-neu-prod-mgmt-private-01", "gch-snet-neu-prod-mgmt-public-01", "gch-snet-neu-prod-mgmt-db-01"]
  # neu-prod-management-subnet_address_prefixes = ["10.251.0.0/26", "10.251.0.64/26", "10.251.0.128/26"]

  # neu-dev-management-subnet_name             = ["gch-snet-neu-dev-mgmt-private-01", "gch-snet-neu-dev-mgmt-public-01", "gch-snet-neu-dev-mgmt-db-01"]
  # neu-dev-management-subnet_address_prefixes = ["10.251.2.0/26", "10.251.2.64/26", "10.251.2.128/26"]

  # neu-prod-identity-subnet_name             = ["gch-snet-neu-prod-identity-private-01", "gch-snet-neu-prod-identity-public-01", "gch-snet-neu-prod-identity-db-01"]
  # neu-prod-identity-subnet_address_prefixes = ["10.251.4.0/26", "10.251.4.64/26", "10.251.4.128/26"]

  # neu-dev-identity-subnet_name             = ["gch-snet-neu-dev-identity-private-01", "gch-snet-neu-dev-identity-public-01", "gch-snet-neu-dev-identity-db-01"]
  # neu-dev-identity-subnet_address_prefixes = ["10.251.6.0/26", "10.251.6.64/26", "10.251.6.128/26"]


  //Landing Zone Subnets
  //IND
  # ind-prod-bts-subnet-name = ["gch-snet-ind-prod-bts-mgmt-private-01", "gch-snet-ind-prod-bts-mgmt-public-01", "gch-snet-ind-prod-bts-mgmt-db-01"]

  # ind-prod-bts-subnet = ["10.248.8.0/26", "10.248.8.64/26", "10.248.8.128/26"]

  # ind-prod-digital-subnet-name = ["gch-snet-ind-prod-digital-mgmt-private-01", "gch-snet-ind-prod-digital-mgmt-public-01", "gch-snet-ind-prod-digital-mgmt-db-01"]

  # ind-prod-digital-subnet = ["10.248.16.0/26", "10.248.16.64/26", "10.248.16.128/26"]

  # ind-dev-bts-subnet-name = ["gch-snet-ind-dev-bts-mgmt-private-01", "gch-snet-ind-dev-bts-mgmt-public-01", "gch-snet-ind-dev-bts-mgmt-db-01"]


  # ind-dev-bts-subnet = ["10.248.14.0/26", "10.248.14.64/26", "10.248.14.128/26"]

  # ind-dev-digital-subnet-name = ["gch-snet-ind-dev-digital-mgmt-private-01", "gch-snet-ind-dev-digital-mgmt-public-01", "gch-snet-ind-dev-digital-mgmt-db-01"]



  # ind-dev-digital-subnet = ["10.248.22.0/26", "10.248.22.64/26", "10.248.22.128/26"]

  # ind-uat-bts-subnet-name = ["gch-snet-ind-uat-bts-mgmt-private-01", "gch-snet-ind-uat-bts-mgmt-public-01", "gch-snet-ind-uat-bts-mgmt-db-01"]

  # ind-uat-bts-subnet = ["10.248.12.0/26", "10.248.12.64/26", "10.248.12.128/26"]

  # ind-uat-digital-subnet-name = ["gch-snet-ind-uat-digital-mgmt-private-01", "gch-snet-ind-uat-digital-mgmt-public-01", "gch-snet-ind-uat-digital-mgmt-db-01"]

  # ind-uat-digital-subnet = ["10.248.20.0/26", "10.248.20.64/26", "10.248.20.128/26"]



  //NEU
  # neu-prod-bts-subnet-name = ["gch-snet-neu-prod-bts-mgmt-private-01", "gch-snet-neu-prod-bts-mgmt-public-01", "gch-snet-neu-prod-bts-mgmt-db-01"]

  # neu-prod-bts-subnet = ["10.251.8.0/26", "10.251.8.64/26", "10.251.8.128/26"]

  # neu-prod-digital-subnet-name = ["gch-snet-neu-prod-digital-mgmt-private-01", "gch-snet-neu-prod-digital-mgmt-public-01", "gch-snet-neu-prod-digital-mgmt-db-01"]


  # neu-prod-digital-subnet = ["10.251.16.0/26", "10.251.16.64/26", "10.251.16.128/26"]

  # neu-dev-bts-subnet-name = ["gch-snet-neu-dev-bts-mgmt-private-01", "gch-snet-neu-dev-bts-mgmt-public-01", "gch-snet-neu-dev-bts-mgmt-db-01"]


  # neu-dev-bts-subnet = ["10.251.24.0/26", "10.251.24.64/26", "10.251.24.128/26"]

  # neu-dev-digital-subnet-name = ["gch-snet-neu-dev-digital-mgmt-private-01", "gch-snet-neu-dev-digital-mgmt-public-01", "gch-snet-neu-dev-digital-mgmt-db-01"]



  # neu-dev-digital-subnet = ["10.251.32.0/26", "10.251.32.64/26", "10.251.32.128/26"]

  # neu-uat-bts-subnet-name = ["gch-snet-neu-uat-bts-mgmt-private-01", "gch-snet-neu-uat-bts-mgmt-public-01", "gch-snet-neu-uat-bts-mgmt-db-01"]

  # neu-uat-bts-subnet = ["10.251.40.0/26", "10.251.40.64/26", "10.251.40.128/26"]

  # neu-uat-digital-subnet-name = ["gch-snet-neu-uat-digital-mgmt-private-01", "gch-snet-neu-uat-digital-mgmt-public-01", "gch-snet-neu-uat-digital-mgmt-db-01"]

  # neu-uat-digital-subnet = ["10.251.44.0/26", "10.251.44.64/26", "10.251.44.128/26"]

  //weu

  weu-prod-bts-subnet-name = ["gch-snet-weu-prod-bts-private-01", "gch-snet-weu-prod-bts-public-01", "gch-snet-weu-prod-bts-db-01"]
  weu-prod-bts-subnet      = ["10.251.136.0/26", "10.251.136.64/26", "10.251.136.128/26"]


  weu-prod-digital-subnet-name = ["gch-snet-weu-prod-digital-private-01", "gch-snet-weu-prod-digital-public-01", "gch-snet-weu-prod-digital-db-01"]
  weu-prod-digital-subnet      = ["10.251.144.0/26", "10.251.144.64/26", "10.251.144.128/26"]

  weu-dev-bts-subnet-name = ["gch-snet-weu-dev-bts-private-01", "gch-snet-weu-dev-bts-public-01", "gch-snet-weu-dev-bts-db-01"]
  weu-dev-bts-subnet      = ["10.251.142.0/26", "10.251.142.64/26", "10.251.142.128/26"]

  weu-dev-digital-subnet-name = ["gch-snet-weu-dev-digital-private-01", "gch-snet-weu-dev-digital-public-01", "gch-snet-weu-dev-digital-db-01"]
  weu-dev-digital-subnet      = ["10.251.150.0/26", "10.251.150.64/26", "10.251.150.128/26"]

  weu-uat-bts-subnet-name = ["gch-snet-weu-uat-bts-private-01", "gch-snet-weu-uat-bts-public-01", "gch-snet-weu-uat-bts-db-01"]
  weu-uat-bts-subnet      = ["10.251.140.0/26", "10.251.140.64/26", "10.251.140.128/26"]

  weu-uat-digital-subnet-name = ["gch-snet-weu-uat-digital-private-01", "gch-snet-weu-uat-digital-public-01", "gch-snet-weu-uat-digital-db-01"]
  weu-uat-digital-subnet      = ["10.251.148.0/26", "10.251.148.64/26", "10.251.148.128/26"]


  //WUS

  # wus-prod-bts-subnet-name = ["gch-snet-wus-prod-bts-mgmt-private-01", "gch-snet-wus-prod-bts-mgmt-public-01", "gch-snet-wus-prod-bts-mgmt-db-01"]

  # wus-prod-bts-subnet = ["10.250.8.0/26", "10.250.8.64/26", "10.250.8.128/26"]

  # wus-prod-digital-subnet-name = ["gch-snet-wus-prod-digital-mgmt-private-01", "gch-snet-wus-prod-digital-mgmt-public-01", "gch-snet-wus-prod-digital-mgmt-db-01"]


  # wus-prod-digital-subnet = ["10.250.16.0/26", "10.250.16.64/26", "10.250.16.128/26"]

  # wus-dev-bts-subnet-name = ["gch-snet-wus-dev-bts-mgmt-private-01", "gch-snet-wus-dev-bts-mgmt-public-01", "gch-snet-wus-dev-bts-mgmt-db-01"]


  # wus-dev-bts-subnet = ["10.250.24.0/26", "10.250.24.64/26", "10.250.24.128/26"]

  # wus-dev-digital-subnet-name = ["gch-snet-wus-dev-digital-mgmt-private-01", "gch-snet-wus-dev-digital-mgmt-public-01", "gch-snet-wus-dev-digital-mgmt-db-01"]



  # wus-dev-digital-subnet = ["10.250.32.0/26", "10.250.32.64/26", "10.250.32.128/26"]

  # wus-uat-bts-subnet-name = ["gch-snet-wus-uat-bts-mgmt-private-01", "gch-snet-wus-uat-bts-mgmt-public-01", "gch-snet-wus-uat-bts-mgmt-db-01"]

  # wus-uat-bts-subnet = ["10.250.40.0/26", "10.250.40.64/26", "10.250.40.128/26"]

  # wus-uat-digital-subnet-name = ["gch-snet-wus-uat-digital-mgmt-private-01", "gch-snet-wus-uat-digital-mgmt-public-01", "gch-snet-wus-uat-digital-mgmt-db-01"]

  # wus-uat-digital-subnet = ["10.250.44.0/26", "10.250.44.64/26", "10.250.44.128/26"]


}

locals {
  dns_zones = ["privatelink.blob.core.windows.net", "privatelink.database.windows.net", "privatelink.file.core.windows.net", "privatelink.vaultcore.azure.net", "privatelink.adf.azure.com", "privatelink.api.azureml.ms", "privatelink.azure-automation.net", "privatelink.azurewebsites.net", "privatelink.datafactory.azure.net", "privatelink.openai.azure.com", "privatelink.queue.core.windows.net", "privatelink.search.windows.net", "privatelink.web.core.windows.net"]
}




locals {
  # vm-keys-ind = ["vm-key-ind-prod-01", "vm-key-ind-dev-01"]
  vm-keys-weu = ["vm-key-weu-uat-bts-01", "vm-key-weu-uat-digital-01", "vm-key-weu-prod-bts-01", "vm-key-weu-prod-digital-01", "vm-key-weu-prod-sec-01", "vm-key-weu-prod-mgmt-01", "vm-key-weu-dev-mgmt-01", "vm-key-weu-dev-bts-01", "vm-key-weu-dev-digital-01", "vm-key-weu-prod-identity-01", "vm-key-weu-dev-identity-01"]
  vm-keys-neu = ["vm-key-neu-prod-01", "vm-key-neu-dev-01"]
  vm-keys-ind = ["vm-key-ind-prod-01", "vm-key-ind-dev-01"]
  vm-keys-wus = ["vm-key-wus-prod-01", "vm-key-wus-dev-01"]
}

locals {
  //Regional Network and Landing Zones (BTS/digital) tags

  prod_shared_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "shared"
    "Department"         = "shared"
    "Stack"              = "Prod"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  prod_bts_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "bts-shared"
    "Department"         = "bts"
    "Stack"              = "Prod"
    "ProvisionedBy"      = "Terraform"

  }


  prod_digital_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "digital-shared"
    "Department"         = "digital"
    "Stack"              = "Prod"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"

  }
  dev_shared_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "shared"
    "Department"         = "shared"
    "Stack"              = "Dev"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  dev_bts_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "bts-shared"
    "Department"         = "bts"
    "Stack"              = "Dev"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }
  dev_digital_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "digital-shared"
    "Department"         = "digital"
    "Stack"              = "Dev"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }
  uat_bts_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "bts-shared"
    "Department"         = "bts"
    "Stack"              = "UAT"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }
  uat_digital_network_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "rajesh.barhia@genpact.com"
    "Owner"              = "ravinder.bhati@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "digital-shared"
    "Department"         = "digital"
    "Stack"              = "UAT"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  prod_shared_zcc_tags = {
    ApplicationSupport = "GenpactProxySupport@genpact.com"
    supportcost        = "$"
    BusinessVertical   = "CorpIT"
    ProvisionedBy      = "Terraform"
    ProjectName        = "corporate"
    PID                = "shared"
    SDOCode            = "8561"
    OwnerSupervisor    = "gaurav.demiwal@genpact.com"
    Stack              = "Prod"
    ProvisioningSR     = "CHG0079549"
    CCCode             = "180"
    Owner              = "keshav.rajput@genpact.com"
    Department         = "shared"
  }

  vm_tags = {

    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
    "ServiceType"         = "IAAS"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"

  }
  prod-lmc-vm-tags = {
    "ApplicationSupport"  = "genpactnmgtoolsteam@genpact.com"
    "OwnerSupervisor"     = "Steven.Zhang@genpact.com"
    "Owner"               = "venkataganeshbabu.k@genpact.com"
    "ProjectName"         = "GCH Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0079549"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Prod"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }

  prod-jump-vm-tags = {
    "ApplicationSupport"  = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"     = "santhosh.srihari@genpact.com"
    "Owner"               = "Ankur.Singhal@genpact.com"
    "ProjectName"         = "GCH Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0079549"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Prod"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }

  dev-jump-vm-tags = {
    "ApplicationSupport"  = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"     = "santhosh.srihari@genpact.com"
    "Owner"               = "Ankur.Singhal@genpact.com"
    "ProjectName"         = "GCH Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0079549"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Dev"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }
  okta-vm-tags = {
    "ApplicationSupport"  = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
    "OwnerSupervisor"     = "pankaj.chugh@genpact.com"
    "Owner"               = "chandrasekhar.babu@genpact.com"
    "ProjectName"         = "GCH Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0079549"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Prod"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }
  ad-vm-tags = {
    "ApplicationSupport"  = "GenpactWintelL3SupportTeam@genpact.com"
    "OwnerSupervisor"     = "vinay.goel@genpact.com"
    "Owner"               = "pavnesh.kumar@genpact.com"
    "ProjectName"         = "GCH Europe Azure Landing Zone"
    "BusinessVertical"    = "CorpIT"
    "SDOCode"             = "8561"
    "CCCode"              = "180"
    "ProvisioningSR"      = "CHG0079549"
    "PID"                 = "shared"
    "Department"          = "shared"
    "Stack"               = "Prod"
    "ProvisionedBy"       = "Terraform"
    "supportcost"         = "$"
    "ServiceType"         = "IAAS"
    "Backup"              = "Daily"
    "DeploymentType"      = "NN"
    "Exception"           = "No"
    "InstanceSchedule"    = "24*7"
    "RI"                  = "TBD"
    "ScheduleforDeletion" = "No"
  }

  paas_tags = {
    "Exception"           = "No"
    "schedulefordeletion" = "No"
    "ServiceType"         = "PAAS"
    "supportcost"         = "$"
    "ProvisionedBy"       = "Terraform"
    "Owner"               = "ravinder.bhati@genpact.com"
  }


  paas_sa_tags = {
    "Exception"           = "Yes"
    "schedulefordeletion" = "No"
    "ServiceType"         = "PAAS"
    "supportcost"         = "$"
    "ProvisionedBy"       = "Terraform"
    "Owner"               = "anandarao.veyyakula@genpact.com"
  }

  # Maximum 15 tags for priavte dns zones.
  paas_dns_tags = {
    "Exception"   = "No"
    "ServiceType" = "PAAS"
  }

  location_ind_tag = {
    "Location" = "Central India"
  }

  location_weu_tag = {
    "Location" = "West Europe"

  }

  location_wus_tag = {
    "Location" = "West US"

  }

  location_neu_tag = {
    "Location" = "North Europe"
  }
}







locals {

  ind_dctags = {

    gch-rg-ind-prod-shared-identity-core-adc = {

      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-ind-prod-shared-identity-core-okta = {

      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-ind-dev-shared-identity-core-adc = {
      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-ind-dev-shared-identity-core-okta = {
      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }

  neu_dctags = {

    gch-rg-neu-prod-shared-identity-core-adc = {

      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-neu-prod-shared-identity-core-okta = {

      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-neu-dev-shared-identity-core-adc = {
      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-neu-dev-shared-identity-core-okta = {
      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }

  weu_dctags = {

    gch-rg-weu-prod-shared-identity-core-adc = {

      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-prod-shared-identity-core-okta = {

      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-dev-shared-identity-core-adc = {
      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-dev-shared-identity-core-okta = {
      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }

  wus_dctags = {

    gch-rg-wus-prod-shared-identity-core-adc = {

      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-wus-prod-shared-identity-core-okta = {

      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-wus-dev-shared-identity-core-adc = {
      "ApplicationSupport" = "GenpactWintelL3SupportTeam@genpact.com"
      "OwnerSupervisor"    = "vinay.goel@genpact.com"
      "Owner"              = "pavnesh.kumar@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-wus-dev-shared-identity-core-okta = {
      "ApplicationSupport" = "GenpactOktaAdmins@genpactonline.onmicrosoft.com"
      "OwnerSupervisor"    = "pankaj.chugh@genpact.com"
      "Owner"              = "chandrasekhar.babu@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }


}


locals {
  weu_rsv_tags = {
    gch-rg-weu-prod-shared-management-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
    gch-rg-weu-dev-shared-management-core-rsv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
  }
  weu_rsv_identity_tags = {
    gch-rg-weu-prod-shared-identity-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-dev-shared-identity-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
  weu_rsv_prod_tags = {
    gch-rg-weu-prod-bts-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-prod-digital-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "191"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
  weu_rsv_dev_tags = {
    gch-rg-weu-dev-bts-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-dev-digital-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "191"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
  weu_rsv_uat_tags = {
    gch-rg-weu-uat-bts-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-uat-digital-core-rsv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "191"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
}


locals {


  ind_zpa_tags = {


    gch-rg-ind-prod-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }

    gch-rg-ind-dev-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"




    }
  }

  neu_zpa_tags = {

    gch-rg-neu-prod-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }

    gch-rg-neu-dev-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"



    }
  }

  weu_zpa_tags = {

    gch-rg-weu-prod-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }

    gch-rg-weu-dev-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }
  }


  wus_zpa_tags = {


    gch-rg-wus-prod-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"


    }

    gch-rg-wus-dev-shared-management-core-zpa = {

      "ApplicationSupport" = "GenpactProxySupport@genpact.com"
      "OwnerSupervisor"    = "mohit.rawat2@genpact.com"
      "Owner"              = "sandeep.singh7@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }


  }

}

//********************************* SECURITY TAGS***********************

locals {

  security_subscription_tags = {

    gch-rg-weu-prod-shared-security-analytics-log = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "amarendra.yadava@genpact.com"
      "Owner"              = "sumeet.kumar2@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "prod-shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-dev-shared-security-analytics-log = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "amarendra.yadava@genpact.com"
      "Owner"              = "sumeet.kumar2@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "dev-shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-prod-shared-flowlog-storage = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "amarendra.yadava@genpact.com"
      "Owner"              = "sumeet.kumar2@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "prod-shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-dev-shared-flowlog-storage = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "amarendra.yadava@genpact.com"
      "Owner"              = "sumeet.kumar2@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "Dev-shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }
}


locals {
  private_dns_zone_tags = {
    gch-rg-weu-shared-private-dns-zone = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "shared"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
}
//********************************************

locals {

  ind_lmc_tags = {


    gch-rg-ind-prod-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-ind-dev-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }


  neu_lmc_tags = {


    gch-rg-neu-prod-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-neu-dev-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }



  weu_lmc_tags = {


    gch-rg-weu-prod-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-dev-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }



  wus_lmc_tags = {


    gch-rg-wus-prod-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-wus-dev-shared-management-core-lmc = {
      "ApplicationSupport" = "genpactnmgtoolsteam@genpact.com"
      "OwnerSupervisor"    = "Steven.Zhang@genpact.com"
      "Owner"              = "venkataganeshbabu.k@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }
}


locals {


  ind_jmp_server_tags = {

    gch-rg-ind-prod-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-ind-dev-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }

  neu_jmp_server_tags = {

    gch-rg-neu-prod-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-neu-dev-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }



  weu_jmp_server_tags = {

    gch-rg-weu-prod-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-dev-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }



  wus_jmp_server_tags = {

    gch-rg-wus-prod-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-wus-dev-shared-management-core-jmp = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "Ankur.Singhal@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }


  }

}


locals {



  weu_bootdiag_tags = {


    gch-rg-weu-prod-shared-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-dev-shared-boot-diag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-prod-shared-security-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-prod-shared-management-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-dev-shared-management-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-prod-shared-identity-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-dev-shared-identity-bootdiag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-prod-digital-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-prod-bts-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-dev-digital-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-dev-bts-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-uat-digital-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
    gch-rg-weu-uat-bts-bootdiag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }



  neu_bootdiag_tags = {


    gch-rg-neu-prod-shared-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-neu-dev-shared-boot-diag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-neu-prod-digital-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-neu-prod-bts-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-neu-dev-digital-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-neu-dev-bts-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }


  ind_bootdiag_tags = {


    gch-rg-ind-prod-shared-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-ind-dev-shared-boot-diag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-ind-prod-digital-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-ind-prod-bts-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-ind-dev-digital-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-ind-dev-bts-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

  }




  wus_bootdiag_tags = {


    gch-rg-wus-prod-shared-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-wus-dev-shared-boot-diag = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-wus-prod-digital-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-wus-prod-bts-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-wus-dev-digital-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-wus-dev-bts-boot-diag = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
}

locals {

  prod_log_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
    "Owner"              = "anandarao.veyyakula@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "shared"
    "Department"         = "shared"
    "Stack"              = "Prod"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  dev_log_tags = {
    "ApplicationSupport" = "genpactcloudsupport@genpact.com"
    "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
    "Owner"              = "anandarao.veyyakula@genpact.com"
    "ProjectName"        = "GCH Europe Azure Landing Zone"
    "BusinessVertical"   = "CorpIT"
    "SDOCode"            = "8561"
    "CCCode"             = "180"
    "ProvisioningSR"     = "CHG0079549"
    "PID"                = "shared"
    "Department"         = "shared"
    "Stack"              = "Dev"
    "ProvisionedBy"      = "Terraform"
    "supportcost"        = "$"
  }

  weu_akv_tags = {

    gch-rg-weu-uat-bts-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    gch-rg-weu-uat-digital-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "UAT"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-prod-bts-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    gch-rg-weu-prod-digital-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-prod-shared-security-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-prod-shared-management-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    gch-rg-weu-dev-shared-management-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-dev-bts-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "bts-shared"
      "Department"         = "bts"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    gch-rg-weu-dev-digital-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "digital-shared"
      "Department"         = "digital"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-weu-prod-shared-identity-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }

    gch-rg-weu-dev-shared-identity-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
  }
  neu_akv_tags = {


    gch-rg-neu-prod-shared-management-core-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-neu-dev-shared-management-core-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
  }
  ind_akv_tags = {


    gch-rg-ind-prod-shared-management-core-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-ind-dev-shared-management-core-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }
  }
  wus_akv_tags = {


    gch-rg-wus-prod-shared-management-core-akv = {
      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Prod"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"
    }

    gch-rg-wus-dev-shared-management-core-akv = {

      "ApplicationSupport" = "genpactcloudsupport@genpact.com"
      "OwnerSupervisor"    = "santhosh.srihari@genpact.com"
      "Owner"              = "anandarao.veyyakula@genpact.com"
      "ProjectName"        = "GCH Europe Azure Landing Zone"
      "BusinessVertical"   = "CorpIT"
      "SDOCode"            = "8561"
      "CCCode"             = "180"
      "ProvisioningSR"     = "CHG0079549"
      "PID"                = "shared"
      "Department"         = "shared"
      "Stack"              = "Dev"
      "ProvisionedBy"      = "Terraform"
      "supportcost"        = "$"

    }
  }
}
