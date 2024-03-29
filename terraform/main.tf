terraform {
  required_version = "= 1.7.0"

  required_providers {
    flux = {
      source  = "fluxcd/flux"
      version = "~> 1.2"
    }
    github = {
      source  = "integrations/github"
      version = "6.1.0"
    }
    kind = {
      source  = "tehcyx/kind"
      version = "0.4.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.27.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}

# ===============================================================
# Construct KinD cluster
# ===============================================================

resource "kind_cluster" "this" {
  name = "flux-e2e"
}

# ===============================================================
# Add deploy key to GitHub repository
# ===============================================================

resource "tls_private_key" "flux" {
  algorithm   = "ECDSA"
  ecdsa_curve = "P256"
}

resource "github_repository_deploy_key" "this" {
  title      = "Flux"
  repository = "flux2-multi-cluster-bootstrap-repo"
  key        = tls_private_key.flux.public_key_openssh
  read_only  = "false"
}

# ===============================================================
# Bootstrap flux using the flux2-mutli-cluster-bootstrap-repo
# ===============================================================

resource "flux_bootstrap_git" "this" {
  path    = var.flux_bootstrap_configuration["git_path"]
  version = var.flux_bootstrap_configuration["version"]
  components_extra = [
    "image-reflector-controller",
    "image-automation-controller"
  ]
}

resource "kubernetes_namespace" "flux_bootstrap" {
  metadata {
    name = "flux-bootstrap"
  }

  lifecycle {
    ignore_changes = [metadata]
  }
}

resource "kubernetes_secret" "flux_bootstrap" {
  metadata {
    name      = "acme-ssh-keypair"
    namespace = kubernetes_namespace.flux_bootstrap.metadata[0].name
  }

  type = "Opaque"

  data = {
    "identity.pub" = tls_private_key.flux.public_key_openssh
    "identity"     = tls_private_key.flux.private_key_pem
    "known_hosts"  = base64encode("github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=")
  }

  depends_on = [kubernetes_namespace.flux_bootstrap]
}
