variable "client" {
  description = "Client name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "repository_url" {
  description = "Repository url (without .git)"
  type        = string
}

variable "access_token" {
  description = "Access token"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "framework_type" {
  description = "Framework type for Amplify app (e.g. 'Next.js - SSR')"
  type        = string
  default     = "Next.js - SSR"
}

variable "basic_auth_username" {
  description = "Basic auth username for uat"
  type        = string
}

variable "basic_auth_password" {
  description = "Basic auth password for uat"
  type        = string
  sensitive   = true

  validation {
    condition     = length(var.basic_auth_password) > 7
    error_message = "Basic auth password must be at least 8 characters long"
  }
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

