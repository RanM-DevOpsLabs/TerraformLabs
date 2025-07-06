resource "docker_image" "flask_hello_world_image" {
  name         = "flask-hello-world:latest"
  keep_locally = false
}

resource "docker_container" "flask_hello_world_container" {
  image = docker_image.flask_hello_world_image.image_id
  name  = "tutorial"
  ports {
    internal = 5000
    external = 5000
  }
}
