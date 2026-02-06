# Install the providers

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

# Provider

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image

resource "docker_image" "debian" {
  name = "debian:latest"
}

# Docker container

resource "docker_container" "devops-toolbox" {
  image = docker_image.debian.image_id
  name  = "devops-toolbox"

  # Ports

  ports {
    internal = 80
    external = 8000
  }

  command = ["tail", "-f", "/dev/null"]
}