variable "flux_bootstrap_configuration" {
  description = "The configuration for the flux bootstrap."
  type        = object({ flux_version = string, git_path = string, git_repo = string })
  default = {
    flux_version = "v2.2.3"
    git_path     = "kustomize/us-west-2-platform-engineering-sbx"
    git_repo     = "git@github.com/swade1987/flux2-multi-cluster-bootstrap-repo"
  }
}

variable "github_token" {
  description = "GitHub token"
  sensitive   = true
  type        = string
  default     = ""
}

variable "github_org" {
  description = "GitHub organization"
  type        = string
  default     = "swade1987"
}
