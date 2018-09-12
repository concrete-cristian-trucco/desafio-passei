# Configure the Docker provider
provider "docker" {
  host = "tcp://127.0.0.1:2376/"
}

# Create a container
resource "docker_container" "application" {
  image = "${docker_image.application.latest}"
  name  = "application"
   ports {
    internal = 8080
    external = 8080
  }
  networks = ["desafio-passei-direto"]
  restart = "on-failure"
  links = ["mysql"]
}

resource "docker_image" "application" {
  name = "concretecristiantrucco/application:1.0"
}


resource "docker_container" "nginx" {
  image = "${docker_image.nginx.latest}"
  name  = "nginx"
   ports {
    internal = 80
    external = 80
  }
  networks = ["desafio-passei-direto"]
  restart = "always"
  links = ["application"]
}
resource "docker_image" "nginx" {
  name = "concretecristiantrucco/desafio_nginx:1.0"
}

resource "docker_container" "mysql" {
  image = "${docker_image.mysql.latest}"
  name  = "mysql"
   ports {
    internal = 3306
    external = 3306
  }
  networks = ["desafio-passei-direto"]
}

resource "docker_image" "mysql" {
  name = "concretecristiantrucco/desafio_mysql:1.0"
}

resource "docker_network" "desafio-passei-direto" {
  name = "desafio-passei-direto"
}