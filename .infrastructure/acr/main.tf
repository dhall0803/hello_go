locals {
  project_code = "go_func_acr_2389"
}


// Create resource group for Container Registry + Function App

resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.project_code}"
  location = var.location
}

// Create Container Registry

resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  sku                      = "Standard"
}