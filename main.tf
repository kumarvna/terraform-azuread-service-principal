data "azuread_client_config" "current" {}

resource "azuread_application" "main" {
  display_name     = var.service_principal_name
  identifier_uris  = ["http://${var.service_principal_name}"]
  owners           = [data.azuread_client_config.current.object_id]
  sign_in_audience = var.sign_in_audience
}

resource "azuread_service_principal" "main" {
  application_id    = azuread_application.main.application_id
  owners            = [data.azuread_client_config.current.object_id]
  alternative_names = var.alternative_names
  description       = var.description
}

resource "time_rotating" "main" {
  rotation_rfc3339 = var.password_end_date
  rotation_years   = var.password_rotation_in_years
  rotation_days    = var.password_rotation_in_days

  triggers = {
    end_date = var.password_end_date
    years    = var.password_rotation_in_years
    days     = var.password_rotation_in_days
  }
}

resource "azuread_service_principal_password" "main" {
  count                = var.enable_service_principal_certificate == false ? 1 : 0
  service_principal_id = azuread_service_principal.main.object_id
  rotate_when_changed = {
    rotation = time_rotating.main.id
  }
}

resource "azuread_service_principal_certificate" "main" {
  count                = var.enable_service_principal_certificate == true ? 1 : 0
  service_principal_id = azuread_service_principal.main.id
  type                 = var.certificate_type
  encoding             = var.certificate_encoding
  key_id               = var.key_id
  value                = file(var.certificate_path)
  end_date             = time_rotating.main.id
}

resource "azurerm_role_assignment" "main" {
  count                = length(var.assignments)
  name                 = var.azure_role_name
  description          = var.azure_role_description
  scope                = var.assignments[count.index].scope
  role_definition_name = var.assignments[count.index].role_definition_name
  principal_id         = azuread_service_principal.main.object_id
}
