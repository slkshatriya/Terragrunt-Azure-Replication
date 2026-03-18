output "automation_account_id" {
  description = "ID of the Automation Account"
  value       = azurerm_automation_account.this.id
}

output "automation_account_name" {
  description = "Name of the Automation Account"
  value       = azurerm_automation_account.this.name
}
