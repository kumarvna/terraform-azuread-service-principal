output "service_principal_name" {
  description = "The name of the service principal"
  value       = module.service-principal.service_principal_name
}

output "service_principal_object_id" {
  description = "The object id of service principal. Can be used to assign roles to user."
  value       = module.service-principal.service_principal_object_id
}

output "service_principal_application_id" {
  description = "The application id of service principal"
  value       = module.service-principal.service_principal_application_id
}

output "client_id" {
  description = "The application id of AzureAD application created."
  value       = module.service-principal.client_id
}

output "client_secret" {
  description = "Password for service principal."
  value       = module.service-principal.client_secret
  sensitive   = true
}

output "service_principal_password" {
  description = "Password for service principal."
  value       = module.service-principal.service_principal_password
  sensitive   = true
}
