module "service-principal" {
  source  = "kumarvna/service-principal/azuread"
  version = "2.0.0"

  service_principal_name               = "simple-appaccess"
  enable_service_principal_certificate = true
  certificate_path                     = "./cert.pem"
  password_rotation_in_years           = 1

  # Adding roles and scope to service principal
  assignments = [
    {
      scope                = "/subscriptions/xxxxx000-0000-0000-0000-xxxx0000xxxx"
      role_definition_name = "Contributor"
    },
  ]
}
