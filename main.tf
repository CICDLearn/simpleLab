terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

# 1. Download the Nginx image (The "blueprint")
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# 2. Create the Container (The "House")
resource "docker_container" "web_server" {
  image = docker_image.nginx.image_id
  name  = "demo-web-server"
  ports {
    internal = 80
    external = 8081 # We will access it at localhost:8081
  }
}