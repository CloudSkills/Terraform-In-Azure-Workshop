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

resource "azurerm_network_security_group" "iqmetrix-sg" {
  name                = "acceptanceTestSecurityGroup1"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_network_ddos_protection_plan" "iqmetrix-ddos" {
  name                = "iqmetrix-ddos"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_virtual_network" "iqmetrix-vnet" {
  name                = "iqmetrix-vnet"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.100", "10.0.0.101"]

  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.iqmetrix-ddos.id
    enable = true
  }

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
}

resource "azurerm_subnet" "iqmetrix-internal" {
  name                 = "internal"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.iqmetrix-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "iqmetrix-nic" {
  name                = "iqmetrix-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "iqmetrixconfig"
    subnet_id                     = azurerm_subnet.iqmetrix-internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

output "networkid" {
  value = azurerm_network_interface.iqmetrix-nic.id
}