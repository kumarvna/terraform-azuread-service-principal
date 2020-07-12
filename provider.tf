terraform {
  required_version = ">= 0.12.20"
}

provider "azurerm" {
  version = "~>2.12.0"
  features {}
}

provider "azuread" {
  version = "~>0.11.0"
}

provider "random" {
  version = "~>2.3.0"
}

provider "time" {
  version = "~>0.5.0"
}
