group "default" {
  targets = ["isync"]
}

target "docker-metadata-action" {}

target "isync" {
  inherits = ["docker-metadata-action"]

  context   = "."
  dockefile = "Dockerfile"

  args {
    TAG = ""
  }
}
