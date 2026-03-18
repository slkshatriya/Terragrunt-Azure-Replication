terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

resource "azurerm_automation_runbook" "this" {
  name                    = var.runbook_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  runbook_type            = var.runbook_type
  log_verbose             = var.log_verbose
  log_progress            = var.log_progress
  description             = var.description
  content                 = var.runbook_content
  tags                    = var.tags
}
