resource "docker_container" "mariadb" {
  name     = "db"
  image    = docker_image.mariadb-image.latest
  hostname = "db"
  networks_advanced {
    name = "my_network"
  }
  ports {
    internal = 3306
    external = 3306
    ip       = "0.0.0.0"
  }
  labels {
    label = "challenge"
    value = "second"
  }
  env = [
    "MYSQL_ROOT_PASSWORD=1234",
    "MYSQL_DATABASE=simple-website"
  ]

  volumes {
    volume_name    = "mariadb-volume"
    container_path = "/var/lib/mysql"
  }
}
