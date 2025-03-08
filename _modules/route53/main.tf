# Configuration de l'association du domaine avec AWS Amplify

# Recherche de la zone hébergée Route53 existante
data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}

# Association du domaine à l'application Amplify (branche principale)
resource "aws_amplify_domain_association" "main" {
  app_id      = var.aws_amplify_app_id
  domain_name = var.domain_name
  
  # Configuration pour le sous-domaine www
  sub_domain {
    branch_name = var.prd_branch_name
    prefix      = "www"
  }
  
  # Configuration pour le domaine apex (sans www)
  sub_domain {
    branch_name = var.prd_branch_name
    prefix      = ""
  }

  # Configuration pour le sous-domaine qrcode (si activé)
  dynamic "sub_domain" {
    for_each = var.prefixlist
    content {
      branch_name = var.prd_branch_name
      prefix      = sub_domain.value
    }
  }

  
  sub_domain {
    branch_name = "uat"
    prefix      = "uat"
  }

  # Désactivation de l'attente de vérification pour permettre à Terraform de continuer
  wait_for_verification = false
}