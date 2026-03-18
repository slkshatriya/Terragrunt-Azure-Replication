output "runbook_id" {
  description = "ID of the Runbook"
  value       = azurerm_automation_runbook.this.id
}

output "runbook_name" {
  description = "Name of the Runbook"
  value       = azurerm_automation_runbook.this.name
}
