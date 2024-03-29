# k8s-releases-bootstrap

This repository is used to bootstrap the Flux v2 setup in the cluster. It is the first repository that is reconciled by Flux v2 after the Terraform is applied.

## Getting started

Before working with the repository it is **mandatory** to execute the following command:

```
make initialise
```

The above command will install the `pre-commit` package and setup pre-commit checks for this repository.

## How does this repository work?

This repo is driven by [Flux](https://fluxcd.io/flux/guides/).

On cluster init this is the first repo reconciled by Flux v2 after Terraform bootstraps Flux into the cluster. See example Terraform configuration [here]().

The bootstrap inits `gitrepositories` and `helmrepositories` from `_base`

All flux resources will be deployed into the namespace `flux-bootstrap` since this will allow us to provision our namespace from the specific directory.

   * k8s-releases-platform (this repo is an example of one used by the Platform Engineering team)
   * k8s-releases-acme (this repo is an example of one used by a product team)

Once installed in the cluster the flux component configuration is persisted inside the `flux-system` directory for each cluster (e.g. `kustomize/platform-engineering-sbx/flux-system`).
