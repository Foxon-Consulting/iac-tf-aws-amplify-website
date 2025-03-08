# Variables pour la configuration Route53 et domaine
variable "domain_name" {
  description = "Nom de domaine principal pour l'application (ex: foxonconsulting.com)"
  type        = string
}

variable "aws_amplify_app_id" {
  description = "ID de l'application Amplify"
  type        = string
}

variable "main_branch_name" {
  description = "Nom de la branche principale pour le déploiement"
  type        = string
  default     = "main"
}

variable "prefixlist" {
  description = "Liste des préfixes pour les sous-domaines"
  type        = list(string)
  default     = []
}

variable "prd_branch_name" {
  description = "Prd branch name"
  type        = string
  default     = "main"
}





