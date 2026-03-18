# ─────────────────────────────────────────────────────────────────────────────
# QA — Resource Group
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
  resource_group_name = "MyResources-QA"
  location            = local.env_vars.locals.location
  tags                = local.env_vars.locals.tags
}
