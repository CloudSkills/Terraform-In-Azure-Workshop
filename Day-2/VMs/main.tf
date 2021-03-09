terraform {
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

