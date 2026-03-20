# 
# DEV Module Version
# Dev always uses the latest local modules (relative path) for rapid iteration.
# QA and Prod use versioned modules from Git tags for stability.
# 

locals {
  # "local" = use relative path (../../../modules/xxx) for fast development
  # Any git tag like "v1.0.0" = pull from GitHub at that specific version
  module_version = "local"
}
