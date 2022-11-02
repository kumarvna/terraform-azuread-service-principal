# Service Principal with certificate

Terraform module to create a service principal with certificate and assign required built-in roles. The outputs from this module, like application_id and password, can be used as an input in other modules.

## Module Usage with PEM certificate

```hcl
# Azurerm provider configuration
provider "azurerm" {
  features {}
}

module "service-principal" {
  source  = "kumarvna/service-principal/azuread"
  version = "2.3.0"

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
```

## Module Usage with .pfx certificate

```hcl
# Azurerm provider configuration
provider "azurerm" {
  features {}
}

module "service-principal" {
  source  = "kumarvna/service-principal/azuread"
  version = "2.3.0"

  service_principal_name               = "simple-appaccess"
  enable_service_principal_certificate = true
  certificate_encoding                 = "base64"
  certificate_path                     = "./keyBag.pfx"
  password_rotation_in_years           = 1

  # Adding roles and scope to service principal
  assignments = [
    {
      scope                = "/subscriptions/xxxxx000-0000-0000-0000-xxxx0000xxxx"
      role_definition_name = "Contributor"
    },
  ]
}
```

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.
