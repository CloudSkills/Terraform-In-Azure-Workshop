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

module "resourcegroup" {
    source = "../Module-RG"

    location = "eastus"
    name = "iqmetrixrg"
}

resource "azurerm_storage_account" "iqmetrixstorage" {
    name = var.name
    resource_group_name = module.resourcegroup.name
    location = module.resourcegroup.location
    account_tier             = "Standard"
    account_replication_type = "GRS"

    depends_on = [ module.resourcegroup ]

}