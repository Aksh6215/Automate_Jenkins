terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
  required_version = ">= 1.0.0"
}

# configuring  the Azure Provider
provider "azurerm" {
  subscription_id = "7c08c6b0-62da-4c5d-9b2f-aa98aeb10f2e"
  tenant_id       = "82867020-455c-4803-86b9-aa60a4339cb8"

  features {

  }
  resource_provider_registrations = "none"
}

# Creating a new resource group
resource "azurerm_resource_group" "new_rg" {
  name     = "akshat21-rg"
  location = "East US"
}

# Creating a Storage Account with a new name 
resource "azurerm_storage_account" "new_storage" {
  name                     = "akshatstorage21"
  resource_group_name      = azurerm_resource_group.new_rg.name
  location                 = azurerm_resource_group.new_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "TerraformDemo"
  }
}

# Creating a storage container with a new name

resource "azurerm_storage_container" "new_container" {
  name                  = "akshat-container"
  storage_account_id    = azurerm_storage_account.new_storage.id
  container_access_type = "private"
}
