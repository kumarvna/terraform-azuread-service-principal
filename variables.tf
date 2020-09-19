variable "service_principal_name" {
  description = "The name of the service principal"
  default     = ""
}

variable "role_definition_name" {
  description = "The name of a Azure built-in Role for the service principal"
  default     = null
}

variable "password_end_date" {
  description = "The relative duration or RFC3339 rotation timestamp after which the password expire"
  default     = null
}

variable "password_rotation_in_years" {
  description = "Number of years to add to the base timestamp to configure the password rotation timestamp. Conflicts with password_end_date and either one is specified and not the both"
  default     = null
}

variable "assignments" {
  description = "The list of role assignments to this service principal"
  type        = list(object({ scope = string, role_definition_name = string }))
  default     = []
}

variable "enable_service_principal_certificate" {
  description = "Manages a Certificate associated with a Service Principal within Azure Active Directory"
  default     = false
}

variable "certificate_type" {
  description = "The type of key/certificate. Must be one of AsymmetricX509Cert or Symmetric"
  default     = "AsymmetricX509Cert"
}

variable "certificate_path" {
  description = "The path to the certificate for this Service Principal"
  default     = ""
}
