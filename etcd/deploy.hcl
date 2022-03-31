metadata {
  path = "etcd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:k5CdD8Vlr0me3PG+iS+YV3s5yGdzm7w69qKb+FF6f0c="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:k5CdD8Vlr0me3PG+iS+YV3s5yGdzm7w69qKb+FF6f0c="
  retries = 1
}

step "terraform-output" {
  wkdir   = "etcd"
  target  = "etcd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "etcd",
  ]

  sha     = "h1:k5CdD8Vlr0me3PG+iS+YV3s5yGdzm7w69qKb+FF6f0c="
  retries = 0
}

step "kube-init" {
  wkdir   = "etcd"
  target  = "etcd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "1a6449ba2ed970ede9ab2c3588696ab94d7448bc5f00ba1e3bbc3529dc0d78d3"
  retries = 0
}

step "crds" {
  wkdir   = "etcd"
  target  = "etcd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "etcd",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "etcd"
  target  = "etcd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "etcd",
  ]

  sha     = "h1:kp4q8nxPc4tOMHfaOev/siivU5cGkI8REDHfU6LnugQ="
  retries = 1
}
