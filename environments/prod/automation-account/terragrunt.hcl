# ─────────────────────────────────────────────────────────────────────────────
# PROD — Automation Account
# ─────────────────────────────────────────────────────────────────────────────

include "root" {
  path = find_in_parent_folders()
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

terraform {
  source = "../../../modules/automation-account"
}

dependency "resource_group" {
  config_path = "../resource-group"
  mock_outputs = {
    resource_group_name     = "mock-rg"
    resource_group_location = "eastus"
  }
}

inputs = {
  automation_account_name = "Prod-AutomateProcess"
  location                = "centralus"  # Must differ from Dev (eastus) & QA (westus2) — Azure allows only 1 Automation Account per subscription per region
  resource_group_name     = dependency.resource_group.outputs.resource_group_name
  sku_name                = "Basic"
  identity_type           = "SystemAssigned"
  tags                    = local.env_vars.locals.tags
}
