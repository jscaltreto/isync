group "default" {
  targets = ["isync"]
}

target "docker-metadata-action" {}

target "isync" {
  context = "."
  dockefile = "Dockerfile"
  args {
    TAG = ""
  }
}
