terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "~>3.59"
        }
    }
}

provider "azurerm" {
    features {}
}