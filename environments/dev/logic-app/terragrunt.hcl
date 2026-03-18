# ─────────────────────────────────────────────────────────────────────────────
# DEV — Logic App
# MATCHES EXISTING: "DevLA" in MyResources-Dev
# No identity attached, no tags
# ─────────────────────────────────────────────────────────────────────────────

include "root" {
  path = find_in_parent_folders()
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

terraform {
  source = "../../../modules/logic-app"
}

dependency "resource_group" {
  config_path = "../resource-group"
  mock_outputs = {
    resource_group_name     = "mock-rg"
    resource_group_location = "eastus"
  }
}

inputs = {
  logic_app_name      = "DevLA"
  location            = dependency.resource_group.outputs.resource_group_location
  resource_group_name = dependency.resource_group.outputs.resource_group_name
  tags                = local.env_vars.locals.tags
}
