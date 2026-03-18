output "logic_app_id" {
  description = "ID of the Logic App"
  value       = azurerm_logic_app_workflow.this.id
}

output "logic_app_name" {
  description = "Name of the Logic App"
  value       = azurerm_logic_app_workflow.this.name
}
