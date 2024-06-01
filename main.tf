terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }

  # Update this block with the location of your terraform state file
  backend "azurerm" {
    resource_group_name  = "mpanickertest"
    storage_account_name = "mpanickertest"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
# resource "azurerm_resource_group" "rg-aks" {
#   name     = var.resource_group_name
#   location = var.location
# }
data "azurerm_resource_group" "storm-cloud-rg" {
  name = "mp-test-rg"
}

resource "azurerm_storage_account" "opa-test" {
  name                          = "opatestdte1234"
  resource_group_name           = data.azurerm_resource_group.storm-cloud-rg.name
  location                      = data.azurerm_resource_group.storm-cloud-rg.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = false
}

resource "azurerm_storage_container" "opa-test-storage-container" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.opa-test.name
  container_access_type = "private"
}
