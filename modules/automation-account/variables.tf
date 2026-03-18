variable "automation_account_name" {
  description = "Name of the Automation Account"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "sku_name" {
  description = "SKU: Basic or Free"
  type        = string
  default     = "Basic"
}

variable "identity_type" {
  description = "Identity type: SystemAssigned, UserAssigned, or null for none"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
