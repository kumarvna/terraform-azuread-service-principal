variable "service_principal_name" {
  description = "The name of the service principal"
  default     = ""
}

variable "sign_in_audience" {
  description = "The Microsoft account types that are supported for the current application. Must be one of `AzureADMyOrg`, `AzureADMultipleOrgs`, `AzureADandPersonalMicrosoftAccount` or `PersonalMicrosoftAccount`"
  default     = "AzureADMyOrg"
}

variable "alternative_names" {
  type        = list(string)
  description = "A set of alternative names, used to retrieve service principals by subscription, identify resource group and full resource ids for managed identities."
  default     = []
}

variable "description" {
  description = "A description of the service principal provided for internal end-users."
  default     = null
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

variable "password_rotation_in_days" {
  description = "Number of days to add to the base timestamp to configure the rotation timestamp. When the current time has passed the rotation timestamp, the resource will trigger recreation.Conflicts with `password_end_date`, `password_rotation_in_years` and either one must be specified, not all"
  default     = null
}

variable "enable_service_principal_certificate" {
  description = "Manages a Certificate associated with a Service Principal within Azure Active Directory"
  default     = false
}

variable "certificate_encoding" {
  description = "Specifies the encoding used for the supplied certificate data. Must be one of `pem`, `base64` or `hex`"
  default     = "pem"
}

variable "key_id" {
  description = "A UUID used to uniquely identify this certificate. If not specified a UUID will be automatically generated."
  default     = null
}

variable "certificate_type" {
  description = "The type of key/certificate. Must be one of AsymmetricX509Cert or Symmetric"
  default     = "AsymmetricX509Cert"
}

variable "certificate_path" {
  description = "The path to the certificate for this Service Principal"
  default     = ""
}

variable "azure_role_name" {
  description = "A unique UUID/GUID for this Role Assignment - one will be generated if not specified."
  default     = null
}

variable "azure_role_description" {
  description = "The description for this Role Assignment"
  default     = null
}

variable "assignments" {
  description = "The list of role assignments to this service principal"
  type = list(object({
    scope                = string
    role_definition_name = string
  }))
  default = []
}
