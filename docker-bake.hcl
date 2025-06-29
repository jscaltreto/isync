group "default" {
  targets = ["isync"]
}

target "docker-metadata-action" {}

target "isync" {
  inherits = ["docker-metadata-action"]

  context   = "."
  dockefile = "Dockerfile"
  
  platforms = [
    "linux/amd64",
    "linux/arm64"
  ]

  args {
    TAG = ""
  }
}
