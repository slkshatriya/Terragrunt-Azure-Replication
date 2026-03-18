# ─────────────────────────────────────────────────────────────────────────────
# PROD — Resource Group
# ─────────────────────────────────────────────────────────────────────────────

include "root" {
  path = find_in_parent_folders()
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

terraform {
  source = "../../../modules/resource-group"
}

inputs = {
  resource_group_name = "MyResources-Prod"
  location            = local.env_vars.locals.location
  tags                = local.env_vars.locals.tags
}
