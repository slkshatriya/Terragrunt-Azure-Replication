# 
# PROD Module Version
# Prod uses versioned modules pinned to a specific Git tag.
# Only update this after QA has been validated with the target version.
# 

locals {
  # Must be a valid Git tag (e.g., "v1.0.0", "v1.1.0", "v2.0.0")
  module_version = "v1.0.0"
}
