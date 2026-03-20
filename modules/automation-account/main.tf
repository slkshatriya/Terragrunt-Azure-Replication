terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# WARNING: Azure soft-deletes Automation Accounts for 30 days after deletion.
# During that 30-day period, the region is BLOCKED for new Automation Accounts
# on the same subscription. The destroy workflow excludes this resource by default.
# Only use "YES - Destroy Everything" option if you understand this limitation.
resource "azurerm_automation_account" "this" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  tags                = var.tags

  # Your existing AutomateProcess uses SystemAssigned identity.
  # This dynamic block adds it only when enabled.
  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type = var.identity_type
    }
  }
}
