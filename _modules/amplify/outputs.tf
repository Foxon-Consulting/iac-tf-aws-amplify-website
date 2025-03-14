# Outputs pour information
output "amplify_app_id" {
  description = "ID of the Amplify app"
  value       = aws_amplify_app.this.id
}

output "amplify_app_name" {
  description = "Nom de l'application Amplify"
  value       = aws_amplify_app.this.name
}

output "amplify_app_default_domain" {
  description = "Default domain of the Amplify app"
  value       = aws_amplify_app.this.default_domain
}

output "amplify_app_arn" {
  description = "ARN de l'application Amplify"
  value       = aws_amplify_app.this.arn
}

output "amplify_branch_id" {
  description = "ID of the main branch"
  value       = aws_amplify_branch.main.id
}

output "amplify_cloudwatch_role_arn" {
  description = "ARN du rôle IAM qui permet à Amplify de logger dans CloudWatch"
  value       = aws_iam_role.amplify_cloudwatch.arn
}

output "amplify_cloudwatch_role_name" {
  description = "Nom du rôle IAM qui permet à Amplify de logger dans CloudWatch"
  value       = aws_iam_role.amplify_cloudwatch.name
}

