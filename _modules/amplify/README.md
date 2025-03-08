<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.30.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.30.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_amplify_app.this](https://registry.terraform.io/providers/hashicorp/aws/5.30.0/docs/resources/amplify_app) | resource |
| [aws_amplify_branch.main](https://registry.terraform.io/providers/hashicorp/aws/5.30.0/docs/resources/amplify_branch) | resource |
| [aws_amplify_branch.uat](https://registry.terraform.io/providers/hashicorp/aws/5.30.0/docs/resources/amplify_branch) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_token"></a> [access\_token](#input\_access\_token) | Access token | `string` | n/a | yes |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | n/a | yes |
| <a name="input_basic_auth_password"></a> [basic\_auth\_password](#input\_basic\_auth\_password) | Basic auth password | `string` | n/a | yes |
| <a name="input_basic_auth_username"></a> [basic\_auth\_username](#input\_basic\_auth\_username) | Basic auth username | `string` | n/a | yes |
| <a name="input_client"></a> [client](#input\_client) | Client name | `string` | n/a | yes |
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | Custom rules | <pre>list(object({<br>    source = string<br>    target = string<br>    status = string<br>  }))</pre> | `[]` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name | `string` | n/a | yes |
| <a name="input_framework_type"></a> [framework\_type](#input\_framework\_type) | Type de framework utilisé pour l'application (ex: Next.js - SSR) | `string` | `"Next.js - SSR"` | no |
| <a name="input_prd_branch_name"></a> [prd\_branch\_name](#input\_prd\_branch\_name) | Prd branch name | `string` | `"main"` | no |
| <a name="input_repository_url"></a> [repository\_url](#input\_repository\_url) | Repository url (without .git) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_amplify_app_arn"></a> [amplify\_app\_arn](#output\_amplify\_app\_arn) | ARN de l'application Amplify |
| <a name="output_amplify_app_default_domain"></a> [amplify\_app\_default\_domain](#output\_amplify\_app\_default\_domain) | Default domain of the Amplify app |
| <a name="output_amplify_app_id"></a> [amplify\_app\_id](#output\_amplify\_app\_id) | ID of the Amplify app |
| <a name="output_amplify_app_name"></a> [amplify\_app\_name](#output\_amplify\_app\_name) | Nom de l'application Amplify |
| <a name="output_amplify_branch_id"></a> [amplify\_branch\_id](#output\_amplify\_branch\_id) | ID of the main branch |
<!-- END_TF_DOCS -->