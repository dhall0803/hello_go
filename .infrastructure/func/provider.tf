terraform {
    required_providers {
        azurerm = {
        source  = "hashicorp/azurerm"
        version = "~>3.59"
        }
    }

    version = "~> 1.4"
}

provider "azurerm" {
    features {}
}