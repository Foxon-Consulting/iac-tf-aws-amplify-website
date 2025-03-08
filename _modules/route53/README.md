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
| [aws_amplify_domain_association.main](https://registry.terraform.io/providers/hashicorp/aws/5.30.0/docs/resources/amplify_domain_association) | resource |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/5.30.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_amplify_app_id"></a> [aws\_amplify\_app\_id](#input\_aws\_amplify\_app\_id) | ID de l'application Amplify | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Nom de domaine principal pour l'application (ex: foxonconsulting.com) | `string` | n/a | yes |
| <a name="input_main_branch_name"></a> [main\_branch\_name](#input\_main\_branch\_name) | Nom de la branche principale pour le déploiement | `string` | `"main"` | no |
| <a name="input_prefixlist"></a> [prefixlist](#input\_prefixlist) | Liste des préfixes pour les sous-domaines | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_amplify_certificate_arn"></a> [amplify\_certificate\_arn](#output\_amplify\_certificate\_arn) | ARN du certificat pour le domaine |
| <a name="output_amplify_domain"></a> [amplify\_domain](#output\_amplify\_domain) | Domaine configuré pour l'application Amplify |
| <a name="output_route53_zone_id"></a> [route53\_zone\_id](#output\_route53\_zone\_id) | ID de la zone Route53 |
<!-- END_TF_DOCS -->