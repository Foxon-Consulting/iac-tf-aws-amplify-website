# Outputs pour information
output "amplify_app_id" {
  description = "ID de l'application Amplify"
  value       = module.amplify_app.amplify_app_id
}

output "amplify_app_name" {
  description = "Nom de l'application Amplify"
  value       = module.amplify_app.amplify_app_name
}

output "amplify_app_default_domain" {
  description = "Domaine par défaut de l'application Amplify"
  value       = module.amplify_app.amplify_app_default_domain
}

output "amplify_app_arn" {
  description = "ARN de l'application Amplify"
  value       = module.amplify_app.amplify_app_arn
}

