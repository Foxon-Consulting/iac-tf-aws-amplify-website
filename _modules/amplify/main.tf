resource "aws_amplify_app" "this" {
  name         = var.app_name
  description  = "Amplify app to deploy static files for ${var.app_name}"
  repository   = var.repository_url
  platform     = "WEB_COMPUTE"
  access_token = var.access_token

  auto_branch_creation_patterns = ["main", "uat", "prd"]
  enable_auto_branch_creation   = true
  enable_branch_auto_build      = true
  enable_branch_auto_deletion   = true

  auto_branch_creation_config {
    enable_auto_build           = true
    stage                       = "DEVELOPMENT"
    enable_pull_request_preview = true
  }

  dynamic "custom_rule" {
    for_each = var.custom_rules
    content {
      source = custom_rule.value.source
      target = custom_rule.value.target
      status = custom_rule.value.status
    }
  }

  tags = {
    client      = var.client
    environment = var.environment
  }
}

# Création et déploiement automatique de la branche principale
resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.this.id
  branch_name = var.prd_branch_name
  
  # Configuration du framework et de l'environnement
  framework = var.framework_type
  stage     = "PRODUCTION"
  
  # Activation du déploiement automatique
  enable_auto_build = true
  
  # Déclenchement immédiat d'un déploiement après la création
  enable_performance_mode = false
  enable_notification     = false
}

# Création et déploiement automatique de la branche uat
resource "aws_amplify_branch" "uat" {
  app_id      = aws_amplify_app.this.id
  branch_name = "uat"
  
  # Configuration du framework et de l'environnement
  framework = var.framework_type
  stage     = "DEVELOPMENT"
  
  # Activation du déploiement automatique
  enable_auto_build = true
  
  # Déclenchement immédiat d'un déploiement après la création
  enable_performance_mode = false
  enable_notification     = false

  enable_basic_auth      = true
  basic_auth_credentials = base64encode("${var.basic_auth_username}:${var.basic_auth_password}")
}