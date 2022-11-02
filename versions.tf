terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.30.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.28.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.7.1"
    }
  }
  required_version = ">= 1.1.9"
}
