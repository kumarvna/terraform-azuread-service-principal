module "service-principal" {
  source  = "kumarvna/service-principal/azuread"
  version = "2.1.0"

  service_principal_name     = "simple-appaccess"
  password_rotation_in_years = 1

  # Adding roles and scope to service principal
  assignments = [
    {
      scope                = "/subscriptions/1e3f0eeb-2235-44cd-b3a3-dcded0861d06" #"/subscriptions/xxxxx000-0000-0000-0000-xxxx0000xxxx"
      role_definition_name = "Contributor"
    },
  ]
}
