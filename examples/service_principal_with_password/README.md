# Service Principal with password

Terraform module to create a service principal and assign required built-in roles. The outputs from this module, like application_id and password, can be used as an input in other modules.

## Module Usage

```hcl
module "service-principal" {
  source  = "kumarvna/service-principal/azuread"
  version = "2.0.0"

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
`service_principal_certificate_id`|The Key ID for the Service Principal Certificate
