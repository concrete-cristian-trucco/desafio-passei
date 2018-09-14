# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create a new docker network
resource "docker_network" "private_network" {
  name = "desafio-passei-direto"
}

# Create a container
resource "docker_container" "application" {
  image = "${docker_image.application.latest}"
  name  = "application"
   ports {
    internal = 8080
    external = 8080
  }
  networks = [  "${docker_network.private_network.name}" ]
  restart = "on-failure"
  links = ["mysql"]
  depends_on = ["docker_container.mysql"]
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
  networks = [  "${docker_network.private_network.name}" ]
  depends_on = ["docker_container.application"]
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
  networks = [  "${docker_network.private_network.name}" ]
  volumes = {
    volume_name    = "db_data"
    container_path = "/data"    
  }

  # Copies all files and folders in apps/app1 to D:/IIS/webapp1

#provisioner "file" {
#    source      = "database_schema.sql"
#    destination = "/data"
#  }

#provisioner "remote-exec" {
#             connection {
#                 type     = "ssh"
 #                user = "root"
 #                password = "root"
  #           }
  #      inline = [
  #         "mysql -u root -p root -h localhost notes < database_schema.sql 2> /dev/null"
  #      ]
   # }
}
resource "docker_image" "mysql" {
  name = "concretecristiantrucco/desafio_mysql:1.0"
}

