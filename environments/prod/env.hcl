# ─────────────────────────────────────────────────────────────────────────────
# PROD Environment Variables
# ─────────────────────────────────────────────────────────────────────────────

locals {
  environment = "prod"
  location    = "eastus"
  tags = {
    environment = "prod"
    managed_by  = "terragrunt"
    criticality = "high"
  }
}
