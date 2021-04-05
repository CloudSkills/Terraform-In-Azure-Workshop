provider "azurerm" {
# A features block as defined below which can be used to customize the behaviour of certain Azure Provider resources.
features {}
}

resource "azurerm_storage_account" "iqmetrixtfstate" {
    name = "cloudskills92sg"
    resource_group_name = "cloudskills-rg"
    location = "eastus"
    account_tier             = "Standard"
    account_replication_type = "GRS"
}

resource "azurerm_storage_container" "tfstatecontainer" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.iqmetrixtfstate.name
  container_access_type = "private"
}