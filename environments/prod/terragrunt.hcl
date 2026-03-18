# ROOT TERRAGRUNT CONFIG - PROD
# Single subscription, OIDC authentication, shared state storage

locals {
  environment = "prod"
}

remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfstatereplication26"
    container_name       = "tfstate"
    key                  = "${local.environment}/${path_relative_to_include()}/terraform.tfstate"
    use_oidc             = true
    client_id            = get_env("ARM_CLIENT_ID", "")
    subscription_id      = get_env("ARM_SUBSCRIPTION_ID", "")
    tenant_id            = get_env("ARM_TENANT_ID", "")
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "azurerm" {
  features {}
  use_oidc = true
}
EOF
}