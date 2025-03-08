module "amplify_app" {
  source = "./_modules/amplify"

  client = var.client
  environment = var.environment
  app_name = var.app_name
  repository_url = var.repository_url
  access_token = var.access_token
  prd_branch_name = var.prd_branch_name
  framework_type = var.framework_type

  basic_auth_username = var.basic_auth_username
  basic_auth_password = var.basic_auth_password

  # Setup redirect from https://qrcode.${var.domain_name} to https://${var.domain_name}
  custom_rules = [
    for prefix in var.prefixlist : {
      source = "https://${prefix}.${var.domain_name}"
      target = "https://${var.domain_name}"
      status = "301"
    }
  ]

}


module "route53" {
  source = "./_modules/route53"

  domain_name = var.domain_name
  aws_amplify_app_id = module.amplify_app.amplify_app_id
  prd_branch_name = var.prd_branch_name


  prefixlist = var.prefixlist

  depends_on = [module.amplify_app]
}

