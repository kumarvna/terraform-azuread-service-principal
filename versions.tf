terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>0.11.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.27.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>2.3.0"
    }
    time = {
      source  = "hashicorp/time"
      version = "~>0.5.0"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}
