<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.30.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_amplify_app"></a> [amplify\_app](#module\_amplify\_app) | ./_modules/amplify | n/a |
| <a name="module_route53"></a> [route53](#module\_route53) | ./_modules/route53 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_token"></a> [access\_token](#input\_access\_token) | Access token | `string` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | n/a | yes |
| <a name="input_basic_auth_password"></a> [basic\_auth\_password](#input\_basic\_auth\_password) | Basic auth password for uat | `string` | n/a | yes |
| <a name="input_basic_auth_username"></a> [basic\_auth\_username](#input\_basic\_auth\_username) | Basic auth username for uat | `string` | n/a | yes |
| <a name="input_client"></a> [client](#input\_client) | Client name | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_framework_type"></a> [framework\_type](#input\_framework\_type) | Framework type for Amplify app (e.g. 'Next.js - SSR') | `string` | `"Next.js - SSR"` | no |
| <a name="input_prd_branch_name"></a> [prd\_branch\_name](#input\_prd\_branch\_name) | Prd branch name | `string` | `"main"` | no |
| <a name="input_prefixlist"></a> [prefixlist](#input\_prefixlist) | Liste des préfixes pour les sous-domaines | `list(string)` | `[]` | no |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | Repository url (without .git) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_amplify_app_arn"></a> [amplify\_app\_arn](#output\_amplify\_app\_arn) | ARN de l'application Amplify |
| <a name="output_amplify_app_default_domain"></a> [amplify\_app\_default\_domain](#output\_amplify\_app\_default\_domain) | Domaine par défaut de l'application Amplify |
| <a name="output_amplify_app_id"></a> [amplify\_app\_id](#output\_amplify\_app\_id) | ID de l'application Amplify |
| <a name="output_amplify_app_name"></a> [amplify\_app\_name](#output\_amplify\_app\_name) | Nom de l'application Amplify |
<!-- END_TF_DOCS -->