# Service Principal Terraform Module

Terraform module to create a service principal with password or certificate and assign required built-in roles. The outputs from this module, like application_id and password, can be used as an input in other modules.

## Module Usage

### Service Principal with password

```hcl
# Azurerm provider configuration
provider "azurerm" {
  features {}
}

module "service-principal" {
  source  = "kumarvna/service-principal/azuread"
  version = "2.3.0"

  service_principal_name     = "simple-appaccess"
  password_rotation_in_years = 1

  # Adding roles and scope to service principal
  assignments = [
    {
      scope                = "/subscriptions/xxxxx000-0000-0000-0000-xxxx0000xxxx"
      role_definition_name = "Contributor"
    },
  ]
}
```

### Service Principal with certificate

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

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

## Outputs

|Name | Description|
|---- | -----------|
`service_principal_name`|The name of the service principal
`service_principal_object_id`|The object id of service principal. Can be used to assign roles to user
`service_principal_application_id`|The application id of service principal
`client_id`|The application id of AzureAD application created
`client_secret`|Password for service principal
`service_principal_password`|Password for service principal
