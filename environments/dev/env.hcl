# ─────────────────────────────────────────────────────────────────────────────
# DEV Environment Variables
# These values match the EXISTING resources in MyResources-Dev
# ─────────────────────────────────────────────────────────────────────────────

locals {
  environment = "dev"
  location    = "eastus"
  tags        = {}    # Existing Dev resources have no tags
}
