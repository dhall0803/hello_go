locals {
  project_code = "go_func_app_2389"
}


resource "azurerm_resource_group" "rg" {
  name     = "rg-${local.project_code}"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage" {
  name                     = "linuxfunctionappsa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "asp" {
  name                = "asp-${local.project_code}"
  resource_group_name = azurerm_resource_group.storage.name
  location            = azurerm_resource_group.storage.location
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "func" {
  name                = "example-linux-function-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id

  site_config {}
}