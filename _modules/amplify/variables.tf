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


variable "prd_branch_name" {
  description = "Prd branch name"
  type        = string
  default     = "main"
}

variable "framework_type" {
  description = "Type de framework utilisé pour l'application (ex: Next.js - SSR)"
  type        = string
  default     = "Next.js - SSR"
}

variable "custom_rules" {
  description = "Custom rules"
  type        = list(object({
    source = string
    target = string
    status = string
  }))
  default = []  
}

variable "basic_auth_username" {
  description = "Basic auth username"
  type        = string
}

variable "basic_auth_password" {
  description = "Basic auth password"
  type        = string
  sensitive   = true
}

variable "environment_variables" {
  description = "Variables d'environnement à configurer pour l'application Amplify"
  type        = map(string)
  default     = {
    AMPLIFY_MONOREPO_APP_ROOT = "."
  }
}

variable "build_spec" {
  description = "Build spec"
  type        = string
}


