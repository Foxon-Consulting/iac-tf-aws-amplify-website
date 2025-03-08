resource "aws_amplify_app" "this" {
  name         = var.app_name
  description  = "Amplify app to deploy static files for ${var.app_name}"
  repository   = var.repository_url
  platform     = "WEB_COMPUTE"
  access_token = var.access_token

  build_spec = var.build_spec

  auto_branch_creation_patterns = ["main", "uat", "prd"]
  enable_auto_branch_creation   = true
  enable_branch_auto_build      = true
  enable_branch_auto_deletion   = true
  
  # Configuration pour CloudWatch logging
  iam_service_role_arn = aws_iam_role.amplify_cloudwatch.arn

  # Configuration des variables d'environnement
  environment_variables = var.environment_variables

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

# Création du rôle IAM pour permettre à Amplify de logger dans CloudWatch
resource "aws_iam_role" "amplify_cloudwatch" {
  name = "AWSSRAmplify"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "amplify.amazonaws.com"
        }
      }
    ]
  })
  
  tags = {
    client      = var.client
    environment = var.environment
  }
}

# Politique IAM spécifique pour notre groupe de logs CloudWatch
resource "aws_iam_policy" "amplify_cloudwatch_policy" {
  name        = "AmplifyCloudWatchLogsPolicy"
  description = "Permet à AWS Amplify d'écrire des logs dans CloudWatch"
  
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "PushLogs",
        Effect = "Allow",
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "arn:aws:logs:eu-west-1:039130791457:log-group:/aws/amplify/*:log-stream:*"
      },
      {
        Sid    = "CreateLogGroup",
        Effect = "Allow",
        Action = "logs:CreateLogGroup",
        Resource = "arn:aws:logs:eu-west-1:039130791457:log-group:/aws/amplify/*"
      },
      {
        Sid    = "DescribeLogGroups",
        Effect = "Allow",
        Action = "logs:DescribeLogGroups",
        Resource = "arn:aws:logs:eu-west-1:039130791457:log-group:*"
      }
    ]
  })
}

# Attache la politique personnalisée au rôle IAM
resource "aws_iam_role_policy_attachment" "amplify_cloudwatch_custom" {
  role       = aws_iam_role.amplify_cloudwatch.name
  policy_arn = aws_iam_policy.amplify_cloudwatch_policy.arn
}

# Attache la politique CloudWatchLogsFullAccess au rôle IAM
resource "aws_iam_role_policy_attachment" "amplify_cloudwatch_logs" {
  role       = aws_iam_role.amplify_cloudwatch.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"
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