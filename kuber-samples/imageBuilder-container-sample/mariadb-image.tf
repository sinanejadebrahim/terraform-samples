resource "docker_image" "mariadb-image" {
  name = "maradb:challenge"
  build {
    path = "lamp_stack/custom_db"
    label = {
      challenge : "second"
    }
  }
}
