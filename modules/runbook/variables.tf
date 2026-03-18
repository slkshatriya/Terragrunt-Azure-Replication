variable "runbook_name" {
  description = "Name of the Runbook"
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

variable "automation_account_name" {
  description = "The Automation Account this Runbook belongs to"
  type        = string
}

variable "runbook_type" {
  description = "PowerShell, PowerShell72, Python2, Python3, or Graph"
  type        = string
  default     = "PowerShell"
}

variable "log_verbose" {
  description = "Enable verbose logging"
  type        = bool
  default     = false
}

variable "log_progress" {
  description = "Enable progress logging"
  type        = bool
  default     = false
}

variable "description" {
  description = "Description of the runbook"
  type        = string
  default     = ""
}

variable "runbook_content" {
  description = "The actual PowerShell/Python script content"
  type        = string
  default     = "Write-Output 'Hello from Runbook'"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}
