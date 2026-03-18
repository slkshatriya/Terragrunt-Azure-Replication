terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_user_assigned_identity" "this" {
  name                = var.managed_identity_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
