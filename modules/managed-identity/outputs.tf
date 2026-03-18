output "managed_identity_id" {
  description = "ID of the Managed Identity"
  value       = azurerm_user_assigned_identity.this.id
}

output "managed_identity_name" {
  description = "Name of the Managed Identity"
  value       = azurerm_user_assigned_identity.this.name
}

output "managed_identity_principal_id" {
  description = "Principal ID of the Managed Identity"
  value       = azurerm_user_assigned_identity.this.principal_id
}

output "managed_identity_client_id" {
  description = "Client ID of the Managed Identity"
  value       = azurerm_user_assigned_identity.this.client_id
}
