# Terraform example

This example shows how to use Terraform to use this repository to bootstrap a specific cluster.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.7.0 |
| <a name="requirement_flux"></a> [flux](#requirement\_flux) | ~> 1.2 |
| <a name="requirement_github"></a> [github](#requirement\_github) | 6.1.0 |
| <a name="requirement_kind"></a> [kind](#requirement\_kind) | 0.4.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.27.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.5 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_flux"></a> [flux](#provider\_flux) | ~> 1.2 |
| <a name="provider_github"></a> [github](#provider\_github) | 6.1.0 |
| <a name="provider_kind"></a> [kind](#provider\_kind) | 0.4.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.27.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [flux_bootstrap_git.this](https://registry.terraform.io/providers/fluxcd/flux/latest/docs/resources/bootstrap_git) | resource |
| [github_repository_deploy_key.this](https://registry.terraform.io/providers/integrations/github/6.1.0/docs/resources/repository_deploy_key) | resource |
| [kind_cluster.this](https://registry.terraform.io/providers/tehcyx/kind/0.4.0/docs/resources/cluster) | resource |
| [kubernetes_namespace.flux_bootstrap](https://registry.terraform.io/providers/hashicorp/kubernetes/2.27.0/docs/resources/namespace) | resource |
| [kubernetes_secret.flux_bootstrap](https://registry.terraform.io/providers/hashicorp/kubernetes/2.27.0/docs/resources/secret) | resource |
| [tls_private_key.flux](https://registry.terraform.io/providers/hashicorp/tls/4.0.5/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_flux_bootstrap_configuration"></a> [flux\_bootstrap\_configuration](#input\_flux\_bootstrap\_configuration) | The configuration for the flux bootstrap. | `object({ flux_version = string, git_path = string, git_repo = string })` | <pre>{<br>  "flux_version": "v2.2.3",<br>  "git_path": "kustomize/us-west-2-platform-engineering-sbx",<br>  "git_repo": "git@github.com/swade1987/flux2-multi-cluster-bootstrap-repo"<br>}</pre> | no |
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | GitHub organization | `string` | `"swade1987"` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | GitHub token | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
