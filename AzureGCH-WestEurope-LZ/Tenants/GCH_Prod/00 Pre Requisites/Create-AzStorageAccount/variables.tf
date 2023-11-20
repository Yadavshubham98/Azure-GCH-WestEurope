locals {
  rg-name  = "gch-rg-weu-prod-shared-terraform"
  location = "westeurope"
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}