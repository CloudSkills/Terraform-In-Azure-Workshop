terraform {
  backend "azurerm" {
    resource_group_name  = "cloudskills-rg"
    storage_account_name = "cloudskills92sg"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
# A features block as defined below which can be used to customize the behaviour of certain Azure Provider resources.
features {}
}

resource "azurerm_resource_group" "iqmetrix-rg" {
    name = var.name
    location = var.location
}