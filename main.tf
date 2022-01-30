# ARM Provider Block
provider "azurerm" {
  features{}
}

# Terraform Backend Configuration Block Pre-Created
terraform {
  backend "azurerm"{

     resource_group_name = "rg-storageaccount" 
     storage_account_name = "githubstorageaccount1"
     container_name = "copystoragetfstate"
     key = "copyterraform.tfstate"
  }
}


# Resource Group Creation Block
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Create Storage Account-1
resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname1"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

# Create Storage Account-2
resource "azurerm_storage_account" "example2" {
  name                     = "storageaccountname2"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}