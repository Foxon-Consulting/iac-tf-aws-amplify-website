
# Outputs pour information
output "amplify_domain" {
  description = "Domaine configuré pour l'application Amplify"
  value       = aws_amplify_domain_association.main.domain_name
}

output "amplify_certificate_arn" {
  description = "ARN du certificat pour le domaine"
  value       = aws_amplify_domain_association.main.arn
}

output "route53_zone_id" {
  description = "ID de la zone Route53"
  value       = data.aws_route53_zone.main.zone_id
}
