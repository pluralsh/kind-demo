metadata {
  path = "minio"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:uAu4UeNsux1O8NroUXK5RhlfsoNvqwa3V4/TGbNXrxo="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:uAu4UeNsux1O8NroUXK5RhlfsoNvqwa3V4/TGbNXrxo="
  retries = 1
}

step "terraform-output" {
  wkdir   = "minio"
  target  = "minio/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "minio",
  ]

  sha     = "h1:uAu4UeNsux1O8NroUXK5RhlfsoNvqwa3V4/TGbNXrxo="
  retries = 0
}

step "kube-init" {
  wkdir   = "minio"
  target  = "minio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "ef43f585d23521767eead5c914c9b6cb558485792149273a78b37146e276479c"
  retries = 0
}

step "crds" {
  wkdir   = "minio"
  target  = "minio/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "minio",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "minio"
  target  = "minio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "minio",
  ]

  sha     = "h1:bR5L9n3Q8Te8S7ysrI+Gew4H18ITSzr19/5O0y9M8DM="
  retries = 1
}
