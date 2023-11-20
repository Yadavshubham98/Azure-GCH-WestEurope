terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.45.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 2.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2.3"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1.1"
    }
  }
  backend "azurerm" {
    resource_group_name  = "gch-rg-eus-prod-shared-terraform" //replace with your own storage account resource group for the state file
    storage_account_name = "gchstoreuspcoretf100"             //replace with your own storage account name
    container_name       = "tfstate-container"                //replace with your own container name
    key                  = "GchWestEurope-ZCCsetup.tfstate"          //replace with your own file name for the state file ending in .tfstate
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  use_msi         = true
  subscription_id = "72452951-68dc-409e-9588-6f0a85306411" //Target account
  features {}
}