# ─────────────────────────────────────────────────────────────────────────────
# QA Environment Variables
# ─────────────────────────────────────────────────────────────────────────────

locals {
  environment = "qa"
  location    = "eastus"
  tags = {
    environment = "qa"
    managed_by  = "terragrunt"
  }
}
