terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}

  client_id       = "7b59d736-18d0-407d-9414-9193e7a1ffbb"
  client_secret   = "00O8Q~n1jLe5vR~bjeKg0b5za7djyx-HLt6Z5aj8"
  tenant_id       = "35c27793-10f8-44c6-8860-9d8dc0b28480"
  subscription_id = "3fb6f8e1-e295-4cc2-92b2-3952e76acb9d"
}