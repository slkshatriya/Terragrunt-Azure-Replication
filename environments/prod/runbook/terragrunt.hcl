# ─────────────────────────────────────────────────────────────────────────────
# PROD — Runbook
# ─────────────────────────────────────────────────────────────────────────────

include "root" {
  path = find_in_parent_folders()
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

terraform {
  source = "../../../modules/runbook"
}

dependency "resource_group" {
  config_path = "../resource-group"
  mock_outputs = {
    resource_group_name     = "mock-rg"
    resource_group_location = "eastus"
  }
}

dependency "automation_account" {
  config_path = "../automation-account"
  mock_outputs = {
    automation_account_name = "mock-automation"
  }
}

inputs = {
  runbook_name            = "Prod-Get-ServicesScript"
  location                = "southeastasia"  # Must match automation account region
  resource_group_name     = dependency.resource_group.outputs.resource_group_name
  automation_account_name = dependency.automation_account.outputs.automation_account_name
  runbook_type            = "PowerShell"
  log_verbose             = false
  log_progress            = false
  description             = ""
  tags                    = local.env_vars.locals.tags

  runbook_content = <<-EOT
    Get-Service | Select-Object Name, Status, DisplayName
  EOT
}
