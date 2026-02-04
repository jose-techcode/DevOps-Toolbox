# Install the providers

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }
}

# Provider

provider "docker" {}

# Docker image

resource "docker_image" "toolbox_luanix" {
  name = "toolbox_luanix:latest"

  build {
    path = "~/Documentos/TOOLBOX_Luanix"
    dockerfile = "Dockerfile"
  }
}

# Docker container

resource "docker_container" "toolbox_luanix" {
  name  = "toolbox_luanix"
  image = docker_image.toolbox_luanix.name

  # Ports

  ports {
    internal = 80
    external = 8000
  }
}