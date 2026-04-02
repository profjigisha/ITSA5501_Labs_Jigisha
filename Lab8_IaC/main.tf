terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "azurerm" {
  features {}
  subscription_id = "xxxxxx-xxxxxx-xxxxxx-xxxxxx"
}

resource "azurerm_resource_group" "rg" {
  #name     = "myLab8TFResourceGroup"
  name = var.rg_name
  location = "canadacentral"
}

resource "azurerm_storage_account" "storage"{
    name = var.storage_name
    resource_group_name = var.rg_name
    location = azurerm_resource_group.rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    tags = {
        Environment = "Terraform for IaC"
        Team = "ITSA5501_W26"
    }
}

resource "azurerm_storage_container" "container"{
    name = "tf-container"
    storage_account_name = azurerm_storage_account.storage.name
    container_access_type = "private"
}