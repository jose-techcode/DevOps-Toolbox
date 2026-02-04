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

resource "docker_image" "devops-toolbox" {
  name = "devops-toolbox:latest"

  build {
    path = "~/Documentos/DevOps-Toolbox/docker-debian"
    dockerfile = "Dockerfile"
  }
}

# Docker container

resource "docker_container" "devops-toolbox" {
  name  = "devops-toolbox"
  image = docker_image.devops-toolbox.name

  # Ports

  ports {
    internal = 80
    external = 8000
  }
}